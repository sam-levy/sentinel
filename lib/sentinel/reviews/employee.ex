defmodule Sentinel.Reviews.Employee do
  @moduledoc """
  A struct representing an employee.
  """

  @fields [:id, :name]

  @enforce_keys @fields
  defstruct @fields

  @type t() :: %__MODULE__{
          id: String.t(),
          name: String.t()
        }

  def build!(%{} = attrs), do: struct!(__MODULE__, attrs)
end
