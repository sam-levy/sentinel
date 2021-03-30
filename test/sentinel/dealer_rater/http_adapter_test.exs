defmodule Sentinel.DealerRater.HTTPAdapterTest do
  use ExUnit.Case, async: true

  import Tesla.Mock

  alias Sentinel.DealerRater.HTTPAdapter
  alias Tesla.Env

  describe "fetch_reviews/2" do
    test "successful 200 response" do
      body = "<html><body>test</body></html>"

      mock(fn
        %{method: :get, url: url} ->
          assert String.ends_with?(url, "/dealer/reviews_path/page1")

          %Env{status: 200, body: body}
      end)

      assert HTTPAdapter.fetch_reviews("/reviews_path", 1) == {:ok, body}
    end

    test "no content 204 response" do
      mock(fn %{method: :get} -> %Env{status: 204} end)

      assert HTTPAdapter.fetch_reviews("/reviews_path", 1) == {:error, :no_content}
    end

    test "bad request 400 response" do
      mock(fn %{method: :get} -> %Env{status: 400} end)

      assert HTTPAdapter.fetch_reviews("/reviews_pat", 1) == {:error, :bad_request}
    end

    test "unauthorized 401 response" do
      mock(fn %{method: :get} -> %Env{status: 401} end)

      assert HTTPAdapter.fetch_reviews("/reviews_path", 1) == {:error, :unauthorized}
    end

    test "not found 404 response" do
      mock(fn %{method: :get} -> %Env{status: 404} end)

      assert HTTPAdapter.fetch_reviews("/reviews_path", 1) == {:error, :not_found}
    end

    test "server error 500 response" do
      mock(fn %{method: :get} -> %Env{status: 500} end)

      assert HTTPAdapter.fetch_reviews("/reviews_path", 1) == {:error, :server_error}
    end

    test "unexpected error" do
      mock(fn %{method: :get} -> %Env{status: 403} end)

      assert {:error, %{status: 403}} = HTTPAdapter.fetch_reviews("/reviews_path", 1)
    end
  end
end
