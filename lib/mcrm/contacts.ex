defmodule Mcrm.Contacts do
  @moduledoc """
  The Contacts context.
  """

  import Ecto.Query, warn: false
  alias Mcrm.Repo

  alias Mcrm.Contacts.ContactInfo

  @doc """
  Returns the list of contactinfos.

  ## Examples

      iex> list_contactinfos()
      [%ContactInfo{}, ...]

  """
  def list_contactinfos do
    Repo.all(ContactInfo)
  end

  @doc """
  Gets a single contact_info.

  Raises `Ecto.NoResultsError` if the Contact info does not exist.

  ## Examples

      iex> get_contact_info!(123)
      %ContactInfo{}

      iex> get_contact_info!(456)
      ** (Ecto.NoResultsError)

  """
  def get_contact_info!(id), do: Repo.get!(ContactInfo, id)

  @doc """
  Creates a contact_info.

  ## Examples

      iex> create_contact_info(%{field: value})
      {:ok, %ContactInfo{}}

      iex> create_contact_info(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_contact_info(attrs \\ %{}) do
    %ContactInfo{}
    |> ContactInfo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a contact_info.

  ## Examples

      iex> update_contact_info(contact_info, %{field: new_value})
      {:ok, %ContactInfo{}}

      iex> update_contact_info(contact_info, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_contact_info(%ContactInfo{} = contact_info, attrs) do
    contact_info
    |> ContactInfo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a contact_info.

  ## Examples

      iex> delete_contact_info(contact_info)
      {:ok, %ContactInfo{}}

      iex> delete_contact_info(contact_info)
      {:error, %Ecto.Changeset{}}

  """
  def delete_contact_info(%ContactInfo{} = contact_info) do
    Repo.delete(contact_info)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking contact_info changes.

  ## Examples

      iex> change_contact_info(contact_info)
      %Ecto.Changeset{data: %ContactInfo{}}

  """
  def change_contact_info(%ContactInfo{} = contact_info, attrs \\ %{}) do
    ContactInfo.changeset(contact_info, attrs)
  end

  alias Mcrm.Contacts.Company

  @doc """
  Returns the list of companies.

  ## Examples

      iex> list_companies()
      [%Company{}, ...]

  """
  def list_companies do
    query = from c in Company, preload: :contacts
    Repo.all(query)
  end

  @doc """
  Gets a single company.

  Raises `Ecto.NoResultsError` if the Company does not exist.

  ## Examples

      iex> get_company!(123)
      %Company{}

      iex> get_company!(456)
      ** (Ecto.NoResultsError)

  """
  def get_company!(id) do
    Repo.get!(Company, id) |> Repo.preload(:contacts)
  end

  @doc """
  Creates a company.

  ## Examples

      iex> create_company(%{field: value})
      {:ok, %Company{}}

      iex> create_company(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_company(attrs \\ %{}) do
    %Company{}
    |> Company.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a company.

  ## Examples

      iex> update_company(company, %{field: new_value})
      {:ok, %Company{}}

      iex> update_company(company, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_company(%Company{} = company, attrs) do
    company
    |> Company.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a company.

  ## Examples

      iex> delete_company(company)
      {:ok, %Company{}}

      iex> delete_company(company)
      {:error, %Ecto.Changeset{}}

  """
  def delete_company(%Company{} = company) do
    Repo.delete(company)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking company changes.

  ## Examples

      iex> change_company(company)
      %Ecto.Changeset{data: %Company{}}

  """
  def change_company(%Company{} = company, attrs \\ %{}) do
    Company.changeset(company, attrs)
  end

  @doc """
  Returns all the companies to be used as options in a select input.
  """
  def get_companies_options() do
    list_companies() |> Enum.map(fn x -> {x.name, x.id} end)
  end

  alias Mcrm.Contacts.Reminder

  @doc """
  Creates a reminder.

  ## Examples

      iex> create_reminder(%{field: value})
      {:ok, %Reminder{}}

      iex> create_reminder(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_reminder(attrs \\ %{}) do
    %Reminder{}
    |> Reminder.changeset(attrs)
    |> Repo.insert()
  end

  def list_reminders do
    query = from c in Reminder, preload: :contact
    Repo.all(query)
  end
end
