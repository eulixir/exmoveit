defmodule Exmoveit.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Exmoveit.Repo,
      # Start the Telemetry supervisor
      ExmoveitWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Exmoveit.PubSub},
      # Start the Endpoint (http/https)
      ExmoveitWeb.Endpoint
      # Start a worker by calling: Exmoveit.Worker.start_link(arg)
      # {Exmoveit.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Exmoveit.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ExmoveitWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
