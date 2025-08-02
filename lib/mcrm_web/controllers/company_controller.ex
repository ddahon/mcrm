defmodule McrmWeb.CompanyController do
  use McrmWeb, :controller

  alias Mcrm.Contacts
  alias Mcrm.Contacts.Company

  def index(conn, _params) do
    companies = Contacts.list_companies()
    render(conn, :index, companies: companies)
  end

  def new(conn, _params) do
    changeset = Contacts.change_company(%Company{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"company" => company_params}) do
    case Contacts.create_company(company_params) do
      {:ok, company} ->
        conn
        |> put_flash(:info, "Company created successfully.")
        |> redirect(to: ~p"/companies/#{company}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    company = Contacts.get_company!(id)
    render(conn, :show, company: company)
  end

  def edit(conn, %{"id" => id}) do
    company = Contacts.get_company!(id)
    changeset = Contacts.change_company(company)
    render(conn, :edit, company: company, changeset: changeset)
  end

  def update(conn, %{"id" => id, "company" => company_params}) do
    company = Contacts.get_company!(id)

    case Contacts.update_company(company, company_params) do
      {:ok, company} ->
        conn
        |> put_flash(:info, "Company updated successfully.")
        |> redirect(to: ~p"/companies/#{company}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, company: company, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    company = Contacts.get_company!(id)
    {:ok, _company} = Contacts.delete_company(company)

    conn
    |> put_flash(:info, "Company deleted successfully.")
    |> redirect(to: ~p"/companies")
  end
end
