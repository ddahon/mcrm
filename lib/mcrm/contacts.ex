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
end
