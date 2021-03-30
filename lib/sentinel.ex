defmodule Sentinel do
  alias Sentinel.{DealerRater, Intelligence}

  @moduledoc """
  Sentinel fetches valuable information about enemy spies activities
  """

  def suspicious_reviews(amount) do
    DealerRater.list_reviews() |> Intelligence.suspicious_reviews(amount)
  end

  def dangerous_offenders(amount) do
    DealerRater.list_reviews() |> Intelligence.dangerous_offenders(amount)
  end
end
