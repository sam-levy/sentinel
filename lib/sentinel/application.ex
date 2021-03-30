defmodule Sentinel.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Sentinel.DealerRater, [pages: 5]}
    ]

    opts = [strategy: :one_for_one, name: Sentinel.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
