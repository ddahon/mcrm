defmodule McrmWeb.Components.TemplateModal do
require Logger
  use McrmWeb, :live_view

  alias Mcrm.Templates

  def mount(_params, _session, socket) do
    {:ok, assign(socket, id: "template-modal")}
  end

  @spec render(any()) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~H"""
    <.modal id={@id}>
      <.form for={%{}} phx-submit="generate_template">
        <.input
          value="1"
          name="template"
          type="select"
          label={gettext("Template")}
          options={Templates.list_mailtemplate_options()}
        />
        <.button type="submit">{gettext("Generate")}</.button>
      </.form>
    </.modal>
    """
  end

  def handle_event("generate_template", %{"template" => template_id}, socket) do
    Logger.debug("Generate template #{template_id}")
  end
end
