defmodule Mcrm.Repo.Migrations.CreateReminders do
  use Ecto.Migration

  def change do
    create table(:reminders) do
      add :description, :string
      add :date, :utc_datetime
      add :contact_info_id, references(:contactinfos)

      timestamps(type: :utc_datetime)
    end
  end
end
