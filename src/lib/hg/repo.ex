defmodule Hg.Repo do
  use Ecto.Repo,
    otp_app: :hg,
    adapter: Ecto.Adapters.Postgres
end
