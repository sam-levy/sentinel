defmodule Sentinel.DealerRater.ParseReviewsTest do
  use ExUnit.Case, async: true

  alias Sentinel.DealerRater.{LocalAdapter, ParseReviews}
  alias Sentinel.Reviews.Review

  alias Sentinel.Support.Factory

  describe "call/1" do
    test "parses reviews" do
      {:ok, reviews_page} = LocalAdapter.fetch_reviews("reviews_path", 1)

      assert {:ok, [%Review{} | _] = reviews} = ParseReviews.call(reviews_page)

      assert Enum.count(reviews) == 10
    end

    test "parses one review" do
      review = Factory.review()

      assert {:ok, [%Review{}]} = ParseReviews.call(review)
    end

    test "no reviews in the page" do
      reviews_page = "<html><body>wrong page format</body></html>"

      assert {:error, :not_found} = ParseReviews.call(reviews_page)
    end

    test "review with wrong format" do
      wrong_review = Factory.wrong_format_review()

      assert {:error, :parsing_error} = ParseReviews.call(wrong_review)
    end

    test "review date with different format" do
      review = Factory.wrong_date_review()

      assert {:ok, [%Review{date: date}]} = ParseReviews.call(review)

      assert is_binary(date)
    end
  end
end
