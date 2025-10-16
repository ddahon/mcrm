defmodule McrmWeb.ReminderController do
  use McrmWeb, :controller

  alias Mcrm.Contacts

  def index(conn, _params) do
    # TODO: |> Enum.filter(&(&1.date == Date.Date.utc_today()))
    reminders = Contacts.list_reminders()
    render(conn, :index, reminders: reminders)
  end
end
