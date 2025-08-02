defmodule Mcrm.Contacts.Company do
  use Ecto.Schema
  import Ecto.Changeset
  alias Mcrm.Contacts.ContactInfo

  schema "companies" do
    field :name, :string
    field :city, :string
    field :region, :string
    field :website, :string
    field :linkedin, :string
    field :email, :string
    field :tel, :string
    field :sector, :string
    has_many :contacts, ContactInfo

    timestamps(type: :utc_datetime)
  end

  @spec changeset(
          {map(),
           %{
             optional(atom()) =>
               atom()
               | {:array | :assoc | :embed | :in | :map | :parameterized | :supertype | :try,
                  any()}
           }}
          | %{
              :__struct__ => atom() | %{:__changeset__ => any(), optional(any()) => any()},
              optional(atom()) => any()
            },
          :invalid | %{optional(:__struct__) => none(), optional(atom() | binary()) => any()}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:name, :city, :region, :website, :linkedin, :email, :tel, :sector])
    |> validate_required([:name, :city, :region, :website, :linkedin, :email, :tel, :sector])
  end
end
