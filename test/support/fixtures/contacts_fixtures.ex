defmodule Mcrm.ContactsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Mcrm.Contacts` context.
  """

  @doc """
  Generate a contact_info.
  """
  def contact_info_fixture(attrs \\ %{}) do
    {:ok, contact_info} =
      attrs
      |> Enum.into(%{

      })
      |> Mcrm.Contacts.create_contact_info()

    contact_info
  end

  @doc """
  Generate a contact_info.
  """
  def contact_info_fixture(attrs \\ %{}) do
    {:ok, contact_info} =
      attrs
      |> Enum.into(%{
        city: "some city",
        email: "some email",
        first_name: "some first_name",
        last_name: "some last_name",
        notes: "some notes",
        region: "some region",
        role: "some role",
        tel: "some tel"
      })
      |> Mcrm.Contacts.create_contact_info()

    contact_info
  end
end
