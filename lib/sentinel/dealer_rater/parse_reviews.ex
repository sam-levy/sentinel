defmodule Sentinel.DealerRater.ParseReviews do
  @moduledoc """
  Parses the reviews HTML page into a list of %Review{}.
  """

  alias Sentinel.Reviews.{Employee, Review}

  def call(reviews_page) do
    case Floki.parse_document(reviews_page) do
      {:ok, html_tree} -> build_reviews(html_tree)
      {:error, reason} -> {:error, reason}
    end
  end

  defp build_reviews(html_tree) do
    case Floki.find(html_tree, "div.review-entry") do
      [] -> {:error, :not_found}
      reviews -> {:ok, Enum.map(reviews, &build_review/1)}
    end
  rescue
    _ -> {:error, :parsing_error}
  end

  defp build_review(review_entry) do
    attrs = %{
      id: extract_id(review_entry),
      date: build_date(review_entry),
      rating: extract_rating(review_entry),
      content: extract_text(review_entry, "p.review-content"),
      employees: build_employees(review_entry)
    }

    Review.build!(attrs)
  end

  defp extract_id(review_entry) do
    review_entry
    |> Floki.attribute("div.review-entry > a", "name")
    |> hd()
    |> extract_text()
    |> build_internal_id()
  end

  defp build_internal_id(id), do: "dr-" <> id

  defp build_date(review_entry) do
    review_entry
    |> Floki.find("div.review-date")
    |> hd()
    |> Floki.filter_out("div.dealership-rating")
    |> Floki.children()
    |> extract_text()
    |> parse_date()
  end

  defp parse_date(string_date) do
    case Datix.Date.parse(string_date, "%B %d, %Y") do
      {:ok, date} -> date
      _ -> string_date
    end
  end

  defp extract_rating(review_entry) do
    review_entry
    |> Floki.find("div.dealership-rating")
    |> Floki.attribute("div.rating-static", "class")
    |> hd()
    |> String.split()
    |> find_rating_class()
    |> parse_rating_from_class()
  end

  defp find_rating_class(classes) do
    Enum.find(classes, fn
      "rating-static" -> false
      <<"rating-", _rating::binary>> -> true
      _ -> false
    end)
  end

  defp parse_rating_from_class(<<"rating-", rating::binary>>), do: String.to_integer(rating)

  defp build_employees(review_entry) do
    review_entry
    |> Floki.find("div.review-employee a")
    |> Enum.map(&build_employee/1)
  end

  defp build_employee(element) do
    attrs = %{
      id: extract_attr(element, "data-emp-id"),
      name: extract_text(element)
    }

    Employee.build!(attrs)
  end

  defp extract_text(node, selector), do: node |> Floki.find(selector) |> extract_text()

  defp extract_text(node) when is_binary(node) do
    {:ok, document} = Floki.parse_document(node)

    extract_text(document)
  end

  defp extract_text(node), do: node |> Floki.text(deep: false) |> String.trim()

  defp extract_attr(element, attr), do: element |> Floki.attribute(attr) |> hd()
end
