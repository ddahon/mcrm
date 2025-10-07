defmodule McrmWeb.ContactInfoLiveTest do
  use McrmWeb.ConnCase

  import Phoenix.LiveViewTest
  import Mcrm.ContactsFixtures

  @create_attrs %{role: "some role", first_name: "some first_name", last_name: "some last_name", city: "some city", region: "some region", tel: "some tel", email: "some email", notes: "some notes"}
  @update_attrs %{role: "some updated role", first_name: "some updated first_name", last_name: "some updated last_name", city: "some updated city", region: "some updated region", tel: "some updated tel", email: "some updated email", notes: "some updated notes"}
  @invalid_attrs %{role: nil, first_name: nil, last_name: nil, city: nil, region: nil, tel: nil, email: nil, notes: nil}

  defp create_contact_info(_) do
    contact_info = contact_info_fixture()
    %{contact_info: contact_info}
  end

  describe "Index" do
    setup [:create_contact_info]

    test "lists all contactinfos", %{conn: conn, contact_info: contact_info} do
      {:ok, _index_live, html} = live(conn, ~p"/contactinfos")

      assert html =~ "Listing Contactinfos"
      assert html =~ contact_info.role
    end

    test "saves new contact_info", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/contactinfos")

      assert index_live |> element("a", "New Contact info") |> render_click() =~
               "New Contact info"

      assert_patch(index_live, ~p"/contactinfos/new")

      assert index_live
             |> form("#contact_info-form", contact_info: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#contact_info-form", contact_info: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/contactinfos")

      html = render(index_live)
      assert html =~ "Contact info created successfully"
      assert html =~ "some role"
    end

    test "updates contact_info in listing", %{conn: conn, contact_info: contact_info} do
      {:ok, index_live, _html} = live(conn, ~p"/contactinfos")

      assert index_live |> element("#contactinfos-#{contact_info.id} a", "Edit") |> render_click() =~
               "Edit Contact info"

      assert_patch(index_live, ~p"/contactinfos/#{contact_info}/edit")

      assert index_live
             |> form("#contact_info-form", contact_info: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#contact_info-form", contact_info: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/contactinfos")

      html = render(index_live)
      assert html =~ "Contact info updated successfully"
      assert html =~ "some updated role"
    end

    test "deletes contact_info in listing", %{conn: conn, contact_info: contact_info} do
      {:ok, index_live, _html} = live(conn, ~p"/contactinfos")

      assert index_live |> element("#contactinfos-#{contact_info.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#contactinfos-#{contact_info.id}")
    end
  end

  describe "Show" do
    setup [:create_contact_info]

    test "displays contact_info", %{conn: conn, contact_info: contact_info} do
      {:ok, _show_live, html} = live(conn, ~p"/contactinfos/#{contact_info}")

      assert html =~ "Show Contact info"
      assert html =~ contact_info.role
    end

    test "updates contact_info within modal", %{conn: conn, contact_info: contact_info} do
      {:ok, show_live, _html} = live(conn, ~p"/contactinfos/#{contact_info}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Contact info"

      assert_patch(show_live, ~p"/contactinfos/#{contact_info}/show/edit")

      assert show_live
             |> form("#contact_info-form", contact_info: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#contact_info-form", contact_info: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/contactinfos/#{contact_info}")

      html = render(show_live)
      assert html =~ "Contact info updated successfully"
      assert html =~ "some updated role"
    end
  end
end
