defmodule CSVParser.Repo do
  use Ecto.Repo,
    otp_app: :csv_parser,
    adapter: Ecto.Adapters.Postgres
end
