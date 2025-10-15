defmodule McrmWeb.ContactInfoLive.Show do
  use McrmWeb, :live_view
  require Logger
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

  @impl true
  def handle_event("toggle_reminder_datepicker", _, socket) do
    {:noreply, update(socket, :show_reminder_datepicker, &(!&1))}
  end

  @impl true
  def handle_event("pick_reminder_date", %{"reminder_date" => date}, socket) do
    Logger.debug("Selected date: #{date}")
    {:ok, utc_date, _} = DateTime.from_iso8601("#{date}T00:00:00Z")
    {:noreply,
     case Contacts.create_reminder(%{date: utc_date, contact_id: socket.assigns.contact_info.id}) do
       {:ok, _} ->
         put_flash(socket, :info, gettext("Reminder created successfully"))

       {:error, error} ->
         put_flash(socket, :error, "#{gettext("Failed to create reminder:")} #{error}")
     end}
  end

  defp page_title(:show), do: "Show Contact info"
  defp page_title(:edit), do: "Edit Contact info"
  defp page_title(:render_template), do: "Render Template"
end
