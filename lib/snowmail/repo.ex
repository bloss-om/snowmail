defmodule Snowmail.Repo do
  use Ecto.Repo,
    otp_app: :snowmail,
    adapter: Ecto.Adapters.Postgres
end
