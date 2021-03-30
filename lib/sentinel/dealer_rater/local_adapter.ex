defmodule Sentinel.DealerRater.LocalAdapter do
  @behaviour Sentinel.DealerRater.Adapter
  @moduledoc """
  Local adapter for DealerRater.com reviews page.
  """

  @impl true
  def fetch_reviews(_reviews_path, _page_number) do
    "test/fixtures/"
    |> Path.join("reviews.html")
    |> File.read()
  end
end
