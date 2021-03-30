defmodule Sentinel.Intelligence do
  @moduledoc """
  Unbelievable intelligence algorithms for identifying KGB spies.
  """

  def suspicious_reviews(reviews, amount) do
    reviews
    |> sort_reviews()
    |> Enum.take(amount)
  end

  def dangerous_offenders(reviews, amount) do
    reviews
    |> sort_offenders()
    |> Enum.take(amount)
  end

  defp sort_reviews(reviews) do
    Enum.sort_by(
      reviews,
      &{&1.rating, String.length(&1.content), Enum.count(&1.employees)},
      :desc
    )
  end

  defp sort_offenders(reviews) do
    reviews
    |> Enum.map(fn %{rating: rating, employees: employees} -> {rating, employees} end)
    |> Enum.group_by(fn {rating, _employees} -> rating end)
    |> Enum.flat_map(&calculate_danger_level/1)
    |> Enum.reduce(%{}, fn {employee, danger_level}, acc ->
      Map.update(acc, employee, danger_level, &(&1 + danger_level))
    end)
    |> Enum.sort_by(fn {_, danger_level} -> danger_level end, :desc)
  end

  defp calculate_danger_level({rating, employees_by_rating}) do
    employees_by_rating
    |> Enum.flat_map(fn {_, employees} -> employees end)
    |> Enum.frequencies()
    |> Enum.map(fn {employee, frequence} -> {employee.name, rating * frequence} end)
  end
end
