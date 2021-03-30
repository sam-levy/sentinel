defmodule Sentinel do
  alias Sentinel.{DealerRater, Intelligence}

  @moduledoc """
  Documentation for `Sentinel`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Sentinel.hello()
      :world

  """
  def hello do
    :world
  end

  def suspicious_reviews(amount) do
    DealerRater.list_reviews() |> Intelligence.suspicious_reviews(amount)
  end

  def dangerous_offenders(amount) do
    DealerRater.list_reviews() |> Intelligence.dangerous_offenders(amount)
  end
end
