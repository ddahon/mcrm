defmodule McrmWeb.ContactInfoLive.Show do
  use McrmWeb, :live_view

  alias Mcrm.Contacts

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :show_reminder_datepicker, false)}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:contact_info, Contacts.get_contact_info!(id))}
  end


  def handle_event("toggle_reminder_datepicker", _, socket) do
    {:noreply, update(socket, :show_reminder_datepicker, &(!&1))}
  end

  defp page_title(:show), do: "Show Contact info"
  defp page_title(:edit), do: "Edit Contact info"
  defp page_title(:render_template), do: "Render Template"
end
