defmodule McrmWeb.ContactInfoControllerTest do
  use McrmWeb.ConnCase

  import Mcrm.ContactsFixtures

  @create_attrs %{role: "some role", first_name: "some first_name", last_name: "some last_name", city: "some city", region: "some region", tel: "some tel", email: "some email", notes: "some notes"}
  @update_attrs %{role: "some updated role", first_name: "some updated first_name", last_name: "some updated last_name", city: "some updated city", region: "some updated region", tel: "some updated tel", email: "some updated email", notes: "some updated notes"}
  @invalid_attrs %{role: nil, first_name: nil, last_name: nil, city: nil, region: nil, tel: nil, email: nil, notes: nil}

  describe "index" do
    test "lists all contactinfos", %{conn: conn} do
      conn = get(conn, ~p"/contactinfos")
      assert html_response(conn, 200) =~ "Listing Contactinfos"
    end
  end

  describe "new contact_info" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/contactinfos/new")
      assert html_response(conn, 200) =~ "New Contact info"
    end
  end

  describe "create contact_info" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/contactinfos", contact_info: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/contactinfos/#{id}"

      conn = get(conn, ~p"/contactinfos/#{id}")
      assert html_response(conn, 200) =~ "Contact info #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/contactinfos", contact_info: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Contact info"
    end
  end

  describe "edit contact_info" do
    setup [:create_contact_info]

    test "renders form for editing chosen contact_info", %{conn: conn, contact_info: contact_info} do
      conn = get(conn, ~p"/contactinfos/#{contact_info}/edit")
      assert html_response(conn, 200) =~ "Edit Contact info"
    end
  end

  describe "update contact_info" do
    setup [:create_contact_info]

    test "redirects when data is valid", %{conn: conn, contact_info: contact_info} do
      conn = put(conn, ~p"/contactinfos/#{contact_info}", contact_info: @update_attrs)
      assert redirected_to(conn) == ~p"/contactinfos/#{contact_info}"

      conn = get(conn, ~p"/contactinfos/#{contact_info}")
      assert html_response(conn, 200) =~ "some updated role"
    end

    test "renders errors when data is invalid", %{conn: conn, contact_info: contact_info} do
      conn = put(conn, ~p"/contactinfos/#{contact_info}", contact_info: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Contact info"
    end
  end

  describe "delete contact_info" do
    setup [:create_contact_info]

    test "deletes chosen contact_info", %{conn: conn, contact_info: contact_info} do
      conn = delete(conn, ~p"/contactinfos/#{contact_info}")
      assert redirected_to(conn) == ~p"/contactinfos"

      assert_error_sent 404, fn ->
        get(conn, ~p"/contactinfos/#{contact_info}")
      end
    end
  end

  defp create_contact_info(_) do
    contact_info = contact_info_fixture()
    %{contact_info: contact_info}
  end
end
