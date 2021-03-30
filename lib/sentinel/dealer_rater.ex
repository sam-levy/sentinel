defmodule Sentinel.DealerRater do
  @moduledoc """
  Module responsible for fetching and storing DealerRater.com reviews.
  In order to not be detected by the KGB counter intelligence, the reviews
  are stored in memory and refreshed every 2 hours. All the consultations
  done within this timeframe will be performed on the cache. If by any chance
  the Soviets detect and put down the Sentinel, the information will still be
  available because Sentinel persists it on disk. If the KGB decides to stop
  their operations in the dealership, the valuable data will still be available.
  """

  use GenServer

  alias Sentinel.DealerRater.{HTTPAdapter, ParseReviews}

  @name __MODULE__

  @reviews_tab :dealer_rater
  @reviews_tab_path "ets_tabs/dealer_rater.tab"

  @last_updated_tab :last_updated
  @last_updated_tab_path "ets_tabs/last_updated.tab"

  # 2 hours
  @refresh_interval 7_200_000
  # 10 seconds
  @error_refetch_interval 10_000

  @default_dealer "/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685"

  def list_reviews do
    case :ets.tab2list(@reviews_tab) do
      [] -> []
      result -> Enum.map(result, fn {_id, review} -> review end)
    end
  end

  def start_link(pages: pages), do: GenServer.start_link(@name, pages: pages)

  @impl true
  def init(pages: pages) do
    PersistentEts.new(@reviews_tab, @reviews_tab_path, [:named_table, read_concurrency: true])

    PersistentEts.new(@last_updated_tab, @last_updated_tab_path, [
      :named_table,
      read_concurrency: true
    ])

    Enum.each(1..pages, &handle_fetch_reviews_from_page/1)

    {:ok, nil}
  end

  @impl true
  def handle_info({:fetch_reviews_from_page, page}, _) do
    handle_fetch_reviews_from_page(page)

    {:noreply, nil}
  end

  defp handle_fetch_reviews_from_page(page) do
    IO.puts("Refreshing cache - Page: #{page}")

    if should_update?(page) do
      case fetch_reviews_from_page(@default_dealer, page) do
        {:ok, reviews} ->
          :ets.insert(@reviews_tab, Enum.map(reviews, &{&1.id, &1}))
          :ets.insert(@last_updated_tab, {{:reviews_page, page}, DateTime.utc_now()})

          PersistentEts.flush(@reviews_tab)
          PersistentEts.flush(@last_updated_tab)

          Process.send_after(self(), {:fetch_reviews_from_page, page}, @refresh_interval)

        {:error, _reason} ->
          Process.send_after(self(), {:fetch_reviews_from_page, page}, @error_refetch_interval)
      end
    end
  end

  defp should_update?(page) do
    case :ets.lookup(@last_updated_tab, {:reviews_page, page}) do
      [{_, last_updated}] ->
        DateTime.diff(DateTime.utc_now(), last_updated) > div(@refresh_interval, 1_000)

      _ ->
        true
    end
  end

  defp fetch_reviews_from_page(dealer_path, page_number) do
    with {:ok, response} <- HTTPAdapter.fetch_reviews(dealer_path, page_number),
         {:ok, reviews} <- ParseReviews.call(response) do
      {:ok, reviews}
    else
      error -> error
    end
  end
end
