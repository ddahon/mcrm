defmodule Mcrm.ContactsTest do
  use Mcrm.DataCase

  alias Mcrm.Contacts

  describe "contactinfos" do
    alias Mcrm.Contacts.ContactInfo

    import Mcrm.ContactsFixtures

    @invalid_attrs %{role: nil, first_name: nil, last_name: nil, city: nil, region: nil, tel: nil, email: nil, notes: nil}

    test "list_contactinfos/0 returns all contactinfos" do
      contact_info = contact_info_fixture()
      assert Contacts.list_contactinfos() == [contact_info]
    end

    test "get_contact_info!/1 returns the contact_info with given id" do
      contact_info = contact_info_fixture()
      assert Contacts.get_contact_info!(contact_info.id) == contact_info
    end

    test "create_contact_info/1 with valid data creates a contact_info" do
      valid_attrs = %{role: "some role", first_name: "some first_name", last_name: "some last_name", city: "some city", region: "some region", tel: "some tel", email: "some email", notes: "some notes"}

      assert {:ok, %ContactInfo{} = contact_info} = Contacts.create_contact_info(valid_attrs)
      assert contact_info.role == "some role"
      assert contact_info.first_name == "some first_name"
      assert contact_info.last_name == "some last_name"
      assert contact_info.city == "some city"
      assert contact_info.region == "some region"
      assert contact_info.tel == "some tel"
      assert contact_info.email == "some email"
      assert contact_info.notes == "some notes"
    end

    test "create_contact_info/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Contacts.create_contact_info(@invalid_attrs)
    end

    test "update_contact_info/2 with valid data updates the contact_info" do
      contact_info = contact_info_fixture()
      update_attrs = %{role: "some updated role", first_name: "some updated first_name", last_name: "some updated last_name", city: "some updated city", region: "some updated region", tel: "some updated tel", email: "some updated email", notes: "some updated notes"}

      assert {:ok, %ContactInfo{} = contact_info} = Contacts.update_contact_info(contact_info, update_attrs)
      assert contact_info.role == "some updated role"
      assert contact_info.first_name == "some updated first_name"
      assert contact_info.last_name == "some updated last_name"
      assert contact_info.city == "some updated city"
      assert contact_info.region == "some updated region"
      assert contact_info.tel == "some updated tel"
      assert contact_info.email == "some updated email"
      assert contact_info.notes == "some updated notes"
    end

    test "update_contact_info/2 with invalid data returns error changeset" do
      contact_info = contact_info_fixture()
      assert {:error, %Ecto.Changeset{}} = Contacts.update_contact_info(contact_info, @invalid_attrs)
      assert contact_info == Contacts.get_contact_info!(contact_info.id)
    end

    test "delete_contact_info/1 deletes the contact_info" do
      contact_info = contact_info_fixture()
      assert {:ok, %ContactInfo{}} = Contacts.delete_contact_info(contact_info)
      assert_raise Ecto.NoResultsError, fn -> Contacts.get_contact_info!(contact_info.id) end
    end

    test "change_contact_info/1 returns a contact_info changeset" do
      contact_info = contact_info_fixture()
      assert %Ecto.Changeset{} = Contacts.change_contact_info(contact_info)
    end
  end

  describe "companies" do
    alias Mcrm.Contacts.Company

    import Mcrm.ContactsFixtures

    @invalid_attrs %{name: nil, city: nil, region: nil, website: nil, linkedin: nil, email: nil, tel: nil, sector: nil}

    test "list_companies/0 returns all companies" do
      company = company_fixture()
      assert Contacts.list_companies() == [company]
    end

    test "get_company!/1 returns the company with given id" do
      company = company_fixture()
      assert Contacts.get_company!(company.id) == company
    end

    test "create_company/1 with valid data creates a company" do
      valid_attrs = %{name: "some name", city: "some city", region: "some region", website: "some website", linkedin: "some linkedin", email: "some email", tel: "some tel", sector: "some sector"}

      assert {:ok, %Company{} = company} = Contacts.create_company(valid_attrs)
      assert company.name == "some name"
      assert company.city == "some city"
      assert company.region == "some region"
      assert company.website == "some website"
      assert company.linkedin == "some linkedin"
      assert company.email == "some email"
      assert company.tel == "some tel"
      assert company.sector == "some sector"
    end

    test "create_company/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Contacts.create_company(@invalid_attrs)
    end

    test "update_company/2 with valid data updates the company" do
      company = company_fixture()
      update_attrs = %{name: "some updated name", city: "some updated city", region: "some updated region", website: "some updated website", linkedin: "some updated linkedin", email: "some updated email", tel: "some updated tel", sector: "some updated sector"}

      assert {:ok, %Company{} = company} = Contacts.update_company(company, update_attrs)
      assert company.name == "some updated name"
      assert company.city == "some updated city"
      assert company.region == "some updated region"
      assert company.website == "some updated website"
      assert company.linkedin == "some updated linkedin"
      assert company.email == "some updated email"
      assert company.tel == "some updated tel"
      assert company.sector == "some updated sector"
    end

    test "update_company/2 with invalid data returns error changeset" do
      company = company_fixture()
      assert {:error, %Ecto.Changeset{}} = Contacts.update_company(company, @invalid_attrs)
      assert company == Contacts.get_company!(company.id)
    end

    test "delete_company/1 deletes the company" do
      company = company_fixture()
      assert {:ok, %Company{}} = Contacts.delete_company(company)
      assert_raise Ecto.NoResultsError, fn -> Contacts.get_company!(company.id) end
    end

    test "change_company/1 returns a company changeset" do
      company = company_fixture()
      assert %Ecto.Changeset{} = Contacts.change_company(company)
    end
  end
end
