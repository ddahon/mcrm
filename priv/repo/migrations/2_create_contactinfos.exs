defmodule Mcrm.Repo.Migrations.CreateContactinfos do
  use Ecto.Migration

  def change do
    create table(:contactinfos) do
      add :first_name, :string
      add :last_name, :string
      add :city, :string
      add :region, :string
      add :tel, :string
      add :email, :string
      add :role, :string
      add :notes, :text
      add :company_id, references(:companies)

      timestamps(type: :utc_datetime)
    end
  end
end
