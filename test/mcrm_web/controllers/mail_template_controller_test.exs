defmodule McrmWeb.MailTemplateControllerTest do
  use McrmWeb.ConnCase

  import Mcrm.TemplatesFixtures

  @create_attrs %{name: "some name", content: "some content"}
  @update_attrs %{name: "some updated name", content: "some updated content"}
  @invalid_attrs %{name: nil, content: nil}

  describe "index" do
    test "lists all mailtemplates", %{conn: conn} do
      conn = get(conn, ~p"/mailtemplates")
      assert html_response(conn, 200) =~ "Listing Mailtemplates"
    end
  end

  describe "new mail_template" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/mailtemplates/new")
      assert html_response(conn, 200) =~ "New Mail template"
    end
  end

  describe "create mail_template" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/mailtemplates", mail_template: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/mailtemplates/#{id}"

      conn = get(conn, ~p"/mailtemplates/#{id}")
      assert html_response(conn, 200) =~ "Mail template #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/mailtemplates", mail_template: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Mail template"
    end
  end

  describe "edit mail_template" do
    setup [:create_mail_template]

    test "renders form for editing chosen mail_template", %{conn: conn, mail_template: mail_template} do
      conn = get(conn, ~p"/mailtemplates/#{mail_template}/edit")
      assert html_response(conn, 200) =~ "Edit Mail template"
    end
  end

  describe "update mail_template" do
    setup [:create_mail_template]

    test "redirects when data is valid", %{conn: conn, mail_template: mail_template} do
      conn = put(conn, ~p"/mailtemplates/#{mail_template}", mail_template: @update_attrs)
      assert redirected_to(conn) == ~p"/mailtemplates/#{mail_template}"

      conn = get(conn, ~p"/mailtemplates/#{mail_template}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, mail_template: mail_template} do
      conn = put(conn, ~p"/mailtemplates/#{mail_template}", mail_template: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Mail template"
    end
  end

  describe "delete mail_template" do
    setup [:create_mail_template]

    test "deletes chosen mail_template", %{conn: conn, mail_template: mail_template} do
      conn = delete(conn, ~p"/mailtemplates/#{mail_template}")
      assert redirected_to(conn) == ~p"/mailtemplates"

      assert_error_sent 404, fn ->
        get(conn, ~p"/mailtemplates/#{mail_template}")
      end
    end
  end

  defp create_mail_template(_) do
    mail_template = mail_template_fixture()
    %{mail_template: mail_template}
  end
end
