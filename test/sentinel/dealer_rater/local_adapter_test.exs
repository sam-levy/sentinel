defmodule Sentinel.DealerRater.LocalAdapterTest do
  use ExUnit.Case, async: true

  alias Sentinel.DealerRater.LocalAdapter

  describe "fetch_reviews/2" do
    test "fetches the reviews page" do
      assert {:ok, reviews_page} = LocalAdapter.fetch_reviews("path", 1)
      assert is_binary(reviews_page)
    end
  end
end
