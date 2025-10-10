defmodule Mcrm.Templates do
  @moduledoc """
  The Templates context.
  """

  import Ecto.Query, warn: false
  require Logger
  alias Mcrm.Repo

  alias Mcrm.Templates.MailTemplate

  @doc """
  Returns the list of mailtemplates.

  ## Examples

      iex> list_mailtemplates()
      [%MailTemplate{}, ...]

  """
  def list_mailtemplates do
    Repo.all(MailTemplate)
  end

  @doc """
  Returns the list of mailtemplates to be used as select options.

  """
  def list_mailtemplate_options do
    list_mailtemplates() |> Enum.map(fn x -> {x.name, x.id} end)
  end

  @doc """
  Gets a single mail_template.

  Raises `Ecto.NoResultsError` if the Mail template does not exist.

  ## Examples

      iex> get_mail_template!(123)
      %MailTemplate{}

      iex> get_mail_template!(456)
      ** (Ecto.NoResultsError)

  """
  def get_mail_template!(id), do: Repo.get!(MailTemplate, id)

  @doc """
  Creates a mail_template.

  ## Examples

      iex> create_mail_template(%{field: value})
      {:ok, %MailTemplate{}}

      iex> create_mail_template(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_mail_template(attrs \\ %{}) do
    %MailTemplate{}
    |> MailTemplate.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a mail_template.

  ## Examples

      iex> update_mail_template(mail_template, %{field: new_value})
      {:ok, %MailTemplate{}}

      iex> update_mail_template(mail_template, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_mail_template(%MailTemplate{} = mail_template, attrs) do
    mail_template
    |> MailTemplate.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a mail_template.

  ## Examples

      iex> delete_mail_template(mail_template)
      {:ok, %MailTemplate{}}

      iex> delete_mail_template(mail_template)
      {:error, %Ecto.Changeset{}}

  """
  def delete_mail_template(%MailTemplate{} = mail_template) do
    Repo.delete(mail_template)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking mail_template changes.

  ## Examples

      iex> change_mail_template(mail_template)
      %Ecto.Changeset{data: %MailTemplate{}}

  """
  def change_mail_template(%MailTemplate{} = mail_template, attrs \\ %{}) do
    MailTemplate.changeset(mail_template, attrs)
  end

  @doc """
  Renders a template

  """
  def render_template(id, contact_info) do
    template = get_mail_template!(id)
    result = Regex.replace(~r/\$(\w+)/, template.content, fn term, var ->
      field = String.to_existing_atom(var)
      Map.get(contact_info, field, term)
    end)
    {:ok, result}
  end
end
