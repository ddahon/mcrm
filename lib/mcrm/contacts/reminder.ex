defmodule Mcrm.Contacts.Reminder do
  use Ecto.Schema
  import Ecto.Changeset
  alias Mcrm.Contacts

  schema "reminders" do
    field :date, :utc_datetime
    field :description, :string

    belongs_to :contact, Contacts.ContactInfo
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(reminder, attrs) do
    reminder
    |> cast(attrs, [:description, :date, :contact_id])
    |> validate_required([:date, :contact_id])
  end
end
