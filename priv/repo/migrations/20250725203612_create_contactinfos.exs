defmodule Mcrm.Repo.Migrations.CreateContactinfos do
  use Ecto.Migration

  def change do
    create table(:contactinfos) do
      add :title, :string
      add :tel, :string
      add :email, :string
      add :website, :string
      add :notes, :string

      timestamps(type: :utc_datetime)
    end
  end
end
