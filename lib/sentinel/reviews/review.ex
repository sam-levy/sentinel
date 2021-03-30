defmodule Sentinel.Reviews.Review do
  @moduledoc """
  A struct representing a review.
  """

  alias Sentinel.Reviews.Employee

  @fields [:id, :date, :rating, :content, :employees]

  @enforce_keys @fields
  defstruct @fields

  @type t() :: %__MODULE__{
          id: String.t(),
          date: Date.t() | String.t(),
          rating: non_neg_integer(),
          content: String.t(),
          employees: [Employee.t()]
        }

  def build!(%{} = attrs), do: struct!(__MODULE__, attrs)
end
