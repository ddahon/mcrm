defmodule McrmWeb.MailTemplateController do
  use McrmWeb, :controller

  alias Mcrm.Templates
  alias Mcrm.Templates.MailTemplate

  def index(conn, _params) do
    mailtemplates = Templates.list_mailtemplates()
    render(conn, :index, mailtemplates: mailtemplates)
  end

  def new(conn, _params) do
    changeset = Templates.change_mail_template(%MailTemplate{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"mail_template" => mail_template_params}) do
    case Templates.create_mail_template(mail_template_params) do
      {:ok, mail_template} ->
        conn
        |> put_flash(:info, "Mail template created successfully.")
        |> redirect(to: ~p"/mailtemplates/#{mail_template}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    mail_template = Templates.get_mail_template!(id)
    render(conn, :show, mail_template: mail_template)
  end

  def edit(conn, %{"id" => id}) do
    mail_template = Templates.get_mail_template!(id)
    changeset = Templates.change_mail_template(mail_template)
    render(conn, :edit, mail_template: mail_template, changeset: changeset)
  end

  def update(conn, %{"id" => id, "mail_template" => mail_template_params}) do
    mail_template = Templates.get_mail_template!(id)

    case Templates.update_mail_template(mail_template, mail_template_params) do
      {:ok, mail_template} ->
        conn
        |> put_flash(:info, "Mail template updated successfully.")
        |> redirect(to: ~p"/mailtemplates/#{mail_template}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, mail_template: mail_template, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    mail_template = Templates.get_mail_template!(id)
    {:ok, _mail_template} = Templates.delete_mail_template(mail_template)

    conn
    |> put_flash(:info, "Mail template deleted successfully.")
    |> redirect(to: ~p"/mailtemplates")
  end
end
