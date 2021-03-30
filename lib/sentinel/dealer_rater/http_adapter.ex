defmodule Sentinel.DealerRater.HTTPAdapter do
  @moduledoc """
  HTTP Adapter for DealerRater.com.
  """

  alias Tesla.Env

  @behaviour Sentinel.DealerRater.Adapter

  @impl true
  def fetch_reviews(reviews_path, page_number) do
    client()
    |> Tesla.get("/dealer#{reviews_path}/page#{page_number}")
    |> handle_response()
  end

  defp handle_response({:ok, %Env{status: 200, body: body}}), do: {:ok, body}
  defp handle_response({:ok, %Env{status: 204}}), do: {:error, :no_content}
  defp handle_response({:ok, %Env{status: 400}}), do: {:error, :bad_request}
  defp handle_response({:ok, %Env{status: 401}}), do: {:error, :unauthorized}
  defp handle_response({:ok, %Env{status: 404}}), do: {:error, :not_found}
  defp handle_response({:ok, %Env{status: 500}}), do: {:error, :server_error}
  defp handle_response({:ok, unexpected_response}), do: {:error, unexpected_response}
  defp handle_response(error), do: error

  defp client do
    middlewares = [
      {Tesla.Middleware.BaseUrl, "https://www.dealerrater.com"},
      {Tesla.Middleware.Headers, [{"user-agent", random_user_agent()}]}
    ]

    Tesla.client(middlewares)
  end

  defp random_user_agent() do
    [
      "Mozilla/5.0 (Windows; U; MSIE 9.0; Windows NT 9.0; en-US)",
      "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/webkit-version (KHTML, like Gecko) Silk/browser-version like Chrome/chrome-version Safari/webkit-version",
      "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Silk/44.1.54 like Chrome/44.0.2403.63 Safari/537.36",
      "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246",
      "Mozilla/5.0 (X11; CrOS x86_64 8172.45.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.64 Safari/537.36",
      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/601.3.9 (KHTML, like Gecko) Version/9.0.2 Safari/601.3.9",
      "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36",
      "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:15.0) Gecko/20100101 Firefox/15.0.1"
    ]
    |> Enum.random()
  end
end
