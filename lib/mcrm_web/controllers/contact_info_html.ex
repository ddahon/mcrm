defmodule McrmWeb.ContactInfoHTML do
  use McrmWeb, :html

  embed_templates "contact_info_html/*"

  @doc """
  Renders a contact_info form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true
  attr :companies, :list, required: true

  def contact_info_form(assigns)
end
