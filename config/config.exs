# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :didgencoughtoday,
  ecto_repos: [Didgencoughtoday.Repo]

# Configures the endpoint
config :didgencoughtoday, DidgencoughtodayWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UXXmB5J3SdN57MXEM9QSdh/6LqNAs+X+4ghUWYWwHGF1JvAO0fJZ/vcL/WcXtSdT",
  render_errors: [view: DidgencoughtodayWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Didgencoughtoday.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "76tjJNs5"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
