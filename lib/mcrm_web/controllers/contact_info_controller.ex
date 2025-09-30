defmodule McrmWeb.ContactInfoController do
  use McrmWeb, :controller

  require Logger
  alias Mcrm.Contacts
  alias Mcrm.Contacts.ContactInfo

  def index(conn, _params) do
    contactinfos = Contacts.list_contactinfos()
    render(conn, :index, contactinfos: contactinfos)
  end

  def new(conn, _params) do
    changeset = Contacts.change_contact_info(%ContactInfo{})
    companies = Contacts.list_companies() |> Enum.map(fn x -> {x.name, x.id} end)
    render(conn, :new, changeset: changeset, companies: companies)
  end

  def create(conn, %{"contact_info" => contact_info_params}) do
    case Contacts.create_contact_info(contact_info_params) do
      {:ok, contact_info} ->
        conn
        |> put_flash(:info, "Contact info created successfully.")
        |> redirect(to: ~p"/contactinfos/#{contact_info}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    contact_info = Contacts.get_contact_info!(id)
    render(conn, :show, contact_info: contact_info)
  end

  def edit(conn, %{"id" => id}) do
    contact_info = Contacts.get_contact_info!(id)
    changeset = Contacts.change_contact_info(contact_info)
    render(conn, :edit, contact_info: contact_info, changeset: changeset)
  end

  def update(conn, %{"id" => id, "contact_info" => contact_info_params}) do
    contact_info = Contacts.get_contact_info!(id)

    case Contacts.update_contact_info(contact_info, contact_info_params) do
      {:ok, contact_info} ->
        conn
        |> put_flash(:info, "Contact info updated successfully.")
        |> redirect(to: ~p"/contactinfos/#{contact_info}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, contact_info: contact_info, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    contact_info = Contacts.get_contact_info!(id)
    {:ok, _contact_info} = Contacts.delete_contact_info(contact_info)

    conn
    |> put_flash(:info, "Contact info deleted successfully.")
    |> redirect(to: ~p"/contactinfos")
  end

  def import(conn, _params) do
    render(conn, :import)
  end

  def process_import(conn, %{"file" => %Plug.Upload{:path => path}}) do
    path
    |> File.stream!
    |> CSV.decode(headers: true)
    |> Enum.map(fn x -> case x do
      {:ok, contact} ->
        IO.inspect(contact)
        |> Mcrm.Contacts.create_contact_info
      {:error, error} -> Logger.debug(:warning, error)
      end
    end)
    conn
    |> redirect(to: ~p"/contactinfos")
  end
end
