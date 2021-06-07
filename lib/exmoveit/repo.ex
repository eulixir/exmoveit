defmodule Exmoveit.Repo do
  use Ecto.Repo,
    otp_app: :exmoveit,
    adapter: Ecto.Adapters.Postgres
end
