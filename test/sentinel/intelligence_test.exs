defmodule Sentinel.IntelligenceTest do
  use ExUnit.Case, async: true

  alias Sentinel.Intelligence
  alias Sentinel.Reviews.{Employee, Review}

  doctest Sentinel.Intelligence

  describe "suspicious_reviews/1" do
    test "returns the most suspicious reviews" do
      reviews = [
        %Review{
          id: "1",
          date: Date.utc_today(),
          rating: 4,
          content: "12",
          employees: [
            %Employee{id: "1", name: "Maria Dobrova"},
            %Employee{id: "2", name: "Oleg Antonovich"},
            %Employee{id: "3", name: "Mikhail Lyubimov"}
          ]
        },
        %Review{
          id: "2",
          date: Date.utc_today(),
          rating: 5,
          content: "123",
          employees: [
            %Employee{id: "1", name: "Maria Dobrova"},
            %Employee{id: "3", name: "Mikhail Lyubimov"}
          ]
        },
        %Review{
          id: "3",
          date: Date.utc_today(),
          rating: 4,
          content: "123456",
          employees: [
            %Employee{id: "2", name: "Oleg Antonovich"},
            %Employee{id: "3", name: "Mikhail Lyubimov"}
          ]
        },
        %Review{
          id: "4",
          date: Date.utc_today(),
          rating: 5,
          content: "12345",
          employees: [
            %Employee{id: "4", name: "Lyudmila Nuikina"}
          ]
        }
      ]

      assert result = Intelligence.suspicious_reviews(reviews, 5)

      assert Enum.map(result, & &1.id) == ["4", "2", "3", "1"]
    end
  end

  describe "sort_offenders/1" do
    @tag :wip
    test "returns the most dangerous offenders" do
      reviews = [
        %Review{
          id: "1",
          date: Date.utc_today(),
          rating: 4,
          content: "12",
          employees: [
            %Employee{id: "1", name: "Maria Dobrova"},
            %Employee{id: "2", name: "Oleg Antonovich"},
            %Employee{id: "3", name: "Mikhail Lyubimov"}
          ]
        },
        %Review{
          id: "2",
          date: Date.utc_today(),
          rating: 5,
          content: "123",
          employees: [
            %Employee{id: "1", name: "Maria Dobrova"},
            %Employee{id: "3", name: "Mikhail Lyubimov"}
          ]
        },
        %Review{
          id: "3",
          date: Date.utc_today(),
          rating: 4,
          content: "123456",
          employees: [
            %Employee{id: "2", name: "Oleg Antonovich"},
            %Employee{id: "3", name: "Mikhail Lyubimov"},
            %Employee{id: "4", name: "Lyudmila Nuikina"}
          ]
        },
        %Review{
          id: "4",
          date: Date.utc_today(),
          rating: 5,
          content: "12345",
          employees: [
            %Employee{id: "4", name: "Lyudmila Nuikina"}
          ]
        }
      ]

      assert Intelligence.dangerous_offenders(reviews, 5) == [
               {"Mikhail Lyubimov", 13},
               {"Lyudmila Nuikina", 9},
               {"Maria Dobrova", 9},
               {"Oleg Antonovich", 8}
             ]
    end
  end
end
