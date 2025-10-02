defmodule Mcrm.Repo.Migrations.CreateMailtemplates do
  use Ecto.Migration

  def change do
    create table(:mailtemplates) do
      add :name, :string
      add :content, :string

      timestamps(type: :utc_datetime)
    end
  end
end
