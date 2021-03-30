defmodule Sentinel.Reviews.EmployeeTest do
  use ExUnit.Case, async: true

  alias Sentinel.Reviews.Employee

  test "builds an employee" do
    attrs = %{
      id: "1",
      name: "Vassili"
    }

    assert %Employee{} = Employee.build!(attrs)
  end

  test "missing required attributes" do
    attrs = %{name: "Vassili"}

    assert_raise ArgumentError, fn ->
      Employee.build!(attrs)
    end
  end
end
