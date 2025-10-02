defmodule Mcrm.Templates.MailTemplate do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mailtemplates" do
    field :name, :string
    field :content, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(mail_template, attrs) do
    mail_template
    |> cast(attrs, [:name, :content])
    |> validate_required([:name, :content])
  end
end
