defmodule McrmWeb.ContactInfoLive.Index do
  use McrmWeb, :live_view

  alias Mcrm.Contacts
  alias Mcrm.Contacts.ContactInfo

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :contactinfos, Contacts.list_contactinfos())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Contact info")
    |> assign(:contact_info, Contacts.get_contact_info!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Contact info")
    |> assign(:contact_info, %ContactInfo{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Contactinfos")
    |> assign(:contact_info, nil)
  end

  @impl true
  def handle_info({McrmWeb.ContactInfoLive.FormComponent, {:saved, contact_info}}, socket) do
    {:noreply, stream_insert(socket, :contactinfos, contact_info)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    contact_info = Contacts.get_contact_info!(id)
    {:ok, _} = Contacts.delete_contact_info(contact_info)

    {:noreply, stream_delete(socket, :contactinfos, contact_info)}
  end
end
