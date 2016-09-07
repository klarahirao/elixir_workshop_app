use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :elixir_workshop_app, ElixirWorkshopApp.Endpoint,
  http: [port: 4001],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :elixir_workshop_app, ElixirWorkshopApp.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "elixir_workshop_app_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
