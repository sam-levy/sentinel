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
      {Tesla.Middleware.BaseUrl, "https://www.dealerrater.com"}
    ]

    Tesla.client(middlewares)
  end
end
