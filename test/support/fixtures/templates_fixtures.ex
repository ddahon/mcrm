defmodule Mcrm.TemplatesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Mcrm.Templates` context.
  """

  @doc """
  Generate a mail_template.
  """
  def mail_template_fixture(attrs \\ %{}) do
    {:ok, mail_template} =
      attrs
      |> Enum.into(%{
        content: "some content",
        name: "some name"
      })
      |> Mcrm.Templates.create_mail_template()

    mail_template
  end
end
