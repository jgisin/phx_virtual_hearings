# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :virtual_hearings,
  ecto_repos: [VirtualHearings.Repo]

# Configures the endpoint
config :virtual_hearings, VirtualHearingsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Ot7NLHJmK8pTXPr9kAZZC/dKnNYB+4k+4t+hHSupTE9+pyTWd/9ZHPeANdkuFc9v",
  render_errors: [view: VirtualHearingsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: VirtualHearings.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: VirtualHearings.Coherence.User,
  repo: VirtualHearings.Repo,
  module: VirtualHearings,
  web_module: VirtualHearingsWeb,
  router: VirtualHearingsWeb.Router,
  messages_backend: VirtualHearingsWeb.Coherence.Messages,
  logged_out_url: "/",
  email_from_name: "Your Name",
  email_from_email: "yourname@example.com",
  opts: [:authenticatable, :recoverable, :lockable, :trackable, :unlockable_with_token, :registerable]

config :coherence, VirtualHearingsWeb.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "your api key here"
# %% End Coherence Configuration %%
