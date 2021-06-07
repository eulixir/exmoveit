# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :exmoveit,
  ecto_repos: [Exmoveit.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :exmoveit, ExmoveitWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pY0dyIGlG68u7ezpzQAQVNEl1yM9mjWidgZYLKY0RK5N9edBtku8+cgaY/N9HaYO",
  render_errors: [view: ExmoveitWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Exmoveit.PubSub,
  live_view: [signing_salt: "zfKTQdUS"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
