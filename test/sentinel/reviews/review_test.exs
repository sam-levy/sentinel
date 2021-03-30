defmodule Sentinel.Reviews.ReviewTest do
  use ExUnit.Case, async: true

  alias Sentinel.Reviews.{Employee, Review}

  test "builds a review" do
    attrs = %{
      id: "1",
      date: Date.utc_today(),
      rating: 5,
      content: "A positive review",
      employees: [%Employee{id: "1", name: "Vassili"}]
    }

    assert %Review{} = Review.build!(attrs)
  end

  test "missing required attributes" do
    attrs = %{
      date: Date.utc_today(),
      rating: 5,
      employees: [%Employee{id: "1", name: "Vassili"}]
    }

    assert_raise ArgumentError, fn ->
      Review.build!(attrs)
    end
  end
end
