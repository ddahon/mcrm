defmodule Mcrm.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :name, :string
      add :city, :string
      add :region, :string
      add :tel, :string
      add :email, :string
      add :sector, :string
      add :website, :string
      add :linkedin, :string

      timestamps(type: :utc_datetime)
    end
  end
end
