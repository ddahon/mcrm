defmodule Mcrm.Repo.Migrations.AddLinkedinLastContactDateAndStatusToUsers do
  use Ecto.Migration

  def change do
    alter table(:contactinfos) do
      add :linkedin, :string
      add :last_contact_date, :date
      add :status, :string
    end
  end
end
