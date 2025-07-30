defmodule Mcrm.Contacts.ContactInfo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contactinfos" do
    field :role, :string
    field :first_name, :string
    field :last_name, :string
    field :city, :string
    field :region, :string
    field :tel, :string
    field :email, :string
    field :notes, :string
    field :linkedin, :string
    field :last_contact_date, :date
    field :status, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(contact_info, attrs) do
    contact_info
    |> cast(attrs, [:first_name, :last_name, :city, :region, :tel, :email, :linkedin, :last_contact_date, :status, :role, :notes])
    |> validate_required([:first_name, :last_name, :city, :region, :tel, :email, :linkedin, :last_contact_date, :status, :role, :notes])
  end
end
