defmodule Mcrm.Repo.Migrations.AddOnDeleteToRemindersContactId do
  use Ecto.Migration

  def up do
    drop constraint(:reminders, "reminders_contact_id_fkey")

    alter table(:reminders) do
      modify :contact_id, references(:contactinfos, on_delete: :delete_all)
    end
  end

  def down do
    drop constraint(:reminders, "reminders_contact_id_fkey")

    alter table(:reminders) do
      modify :contact_id, references(:contactinfos, on_delete: :nothing)
    end
  end
end
