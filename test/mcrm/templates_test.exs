defmodule Mcrm.TemplatesTest do
  use Mcrm.DataCase

  alias Mcrm.Templates

  describe "mailtemplates" do
    alias Mcrm.Templates.MailTemplate

    import Mcrm.TemplatesFixtures

    @invalid_attrs %{name: nil, content: nil}

    test "list_mailtemplates/0 returns all mailtemplates" do
      mail_template = mail_template_fixture()
      assert Templates.list_mailtemplates() == [mail_template]
    end

    test "get_mail_template!/1 returns the mail_template with given id" do
      mail_template = mail_template_fixture()
      assert Templates.get_mail_template!(mail_template.id) == mail_template
    end

    test "create_mail_template/1 with valid data creates a mail_template" do
      valid_attrs = %{name: "some name", content: "some content"}

      assert {:ok, %MailTemplate{} = mail_template} = Templates.create_mail_template(valid_attrs)
      assert mail_template.name == "some name"
      assert mail_template.content == "some content"
    end

    test "create_mail_template/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Templates.create_mail_template(@invalid_attrs)
    end

    test "update_mail_template/2 with valid data updates the mail_template" do
      mail_template = mail_template_fixture()
      update_attrs = %{name: "some updated name", content: "some updated content"}

      assert {:ok, %MailTemplate{} = mail_template} = Templates.update_mail_template(mail_template, update_attrs)
      assert mail_template.name == "some updated name"
      assert mail_template.content == "some updated content"
    end

    test "update_mail_template/2 with invalid data returns error changeset" do
      mail_template = mail_template_fixture()
      assert {:error, %Ecto.Changeset{}} = Templates.update_mail_template(mail_template, @invalid_attrs)
      assert mail_template == Templates.get_mail_template!(mail_template.id)
    end

    test "delete_mail_template/1 deletes the mail_template" do
      mail_template = mail_template_fixture()
      assert {:ok, %MailTemplate{}} = Templates.delete_mail_template(mail_template)
      assert_raise Ecto.NoResultsError, fn -> Templates.get_mail_template!(mail_template.id) end
    end

    test "change_mail_template/1 returns a mail_template changeset" do
      mail_template = mail_template_fixture()
      assert %Ecto.Changeset{} = Templates.change_mail_template(mail_template)
    end
  end
end
