defmodule AirdropEngine.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      {Registry, keys: :unique, name: Registry.Game},
      AirdropEngine.GameSupervisor
    ]

    :ets.new(:game_state, [:public, :named_table])

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AirdropEngine.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
