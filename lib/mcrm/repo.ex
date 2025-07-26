defmodule Mcrm.Repo do
  use Ecto.Repo,
    otp_app: :mcrm,
    adapter: Ecto.Adapters.Postgres
end
