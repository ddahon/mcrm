defmodule Mcrm.Company do
  use Ecto.Schema
  import Ecto.Changeset

  schema "companies" do
    field :name, :string
    field :city, :string
    field :region, :string
    field :tel, :string
    field :email, :string
    field :sector, :string
    field :website, :string
    field :linkedin, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:name, :city, :region, :tel, :email, :sector, :website, :linkedin])
    |> validate_required([:name, :city, :region, :tel, :email, :sector, :website, :linkedin])
  end
end
