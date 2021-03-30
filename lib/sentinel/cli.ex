defmodule Sentinel.CLI do
  use Task

  alias Sentinel
  alias Sentinel.Reviews.Review

  def start_link(_arg) do
    Task.start_link(__MODULE__, :run, [])
  end

  def run do
    show_welcome()
    show_menu()
    ask_for_action()
  end

  defp show_welcome() do
    IEx.Helpers.clear()

    IO.puts("""

    ---------------------------------
    ####   Welcome to Sentinel   ####
    ---------------------------------

    """)
  end

  defp show_menu() do
    IO.puts("""
    ---------------------------------
    #########      Menu      ########
    ---------------------------------
    1 - Show most suspicious reviews
    2 - Show most dangerous offenders
    3 - Exit
    """)
  end

  defp ask_for_action(message \\ "Please type an option") do
    IO.puts(["\n", "---------------------------------"])

    IO.gets([message, "\n", "> "])
    |> String.trim()
    |> execute()
  end

  defp execute("1") do
    IEx.Helpers.clear()

    IO.puts("""

    ########################################################################

    ## These are the top reviews from our suspects in order of dangerousness:

    """)

    3
    |> Sentinel.suspicious_reviews()
    |> Enum.each(&report_template/1)

    ask_for_action("Type 'm' to go back to the menu")
  end

  defp execute("2") do
    IEx.Helpers.clear()

    IO.puts("""

    ########################################################################

    ## These are the most dangerous offenders based on the CIA super precise
    ## offender sorting algorithm:

    """)

    3
    |> Sentinel.dangerous_offenders()
    |> Enum.with_index()
    |> Enum.each(&offender_template/1)

    ask_for_action("Type 'm' to go back to the menu")
  end

  defp execute("3") do
    IEx.Helpers.clear()
    IO.puts(["Stay safe", "\n"])
    System.halt()
  end

  defp execute("m"), do: run()

  defp execute(_), do: ask_for_action("Invalid option, please try again")

  defp report_template(%Review{} = report) do
    IO.puts("""
    ---------------------------------------

    Date: #{strf_date(report.date)}
    Rating: #{format_rating(report.rating)}

    #{report.content}
    """)
  end

  defp offender_template({{offender, score}, index}) do
    IO.puts("""
    ---------------------------------------
    #{index + 1} - Name: #{offender}
        Dangerousness level: #{score}
    """)
  end

  defp strf_date(date), do: Calendar.strftime(date, "%B %d, %Y")

  defp format_rating(rating), do: rating / 10
end
