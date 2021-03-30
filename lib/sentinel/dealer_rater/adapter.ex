defmodule Sentinel.DealerRater.Adapter do
  @callback fetch_reviews(reviews_path :: String.t(), page_number :: integer()) ::
              {:ok, term()} | {:error, atom()}
end
