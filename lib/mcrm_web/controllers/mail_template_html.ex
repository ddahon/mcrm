defmodule McrmWeb.MailTemplateHTML do
  use McrmWeb, :html

  embed_templates "mail_template_html/*"

  @doc """
  Renders a mail_template form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def mail_template_form(assigns)
end
