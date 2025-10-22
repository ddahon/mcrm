defmodule McrmWeb.ReminderController do
  use McrmWeb, :controller

  alias Mcrm.Contacts

  def index(conn, _params) do
    reminders =
      Contacts.list_reminders()
      |> Enum.filter(&(DateTime.to_date(&1.date) == Date.utc_today()))

    render(conn, :index, reminders: reminders)
  end
end
