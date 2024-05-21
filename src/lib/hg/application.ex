defmodule Hg.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      HgWeb.Telemetry,
      Hg.Repo,
      {DNSCluster, query: Application.get_env(:hg, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Hg.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Hg.Finch},
      # Start a worker by calling: Hg.Worker.start_link(arg)
      # {Hg.Worker, arg},
      # Start to serve requests, typically the last entry
      HgWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Hg.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HgWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
