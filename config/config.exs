# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :flash_cards,
  ecto_repos: [FlashCards.Repo]

# Configures the endpoint
config :flash_cards, FlashCardsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "d796IlX5wK/Ki5Tqj3mNvIedlBYpFVz1V/zp/EUeTdWSwwDxUjkVJtxsEhJtfrIr",
  render_errors: [view: FlashCardsWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: FlashCards.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
