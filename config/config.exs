# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :csv_parser,
  namespace: CSVParser,
  ecto_repos: [CSVParser.Repo]

# Configures the endpoint
config :csv_parser, CSVParserWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1g+k3Fnz1LsP6qjsO5/j9NcQlgjJ88eesQhBgJ6GAVagIy39E5/OFlUBHbxdV8Cu",
  render_errors: [view: CSVParserWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: CSVParser.PubSub,
  live_view: [signing_salt: "Gx8m7t4B"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
