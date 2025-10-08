defmodule McrmWeb.ContactInfoLive.GenerateTemplateComponent do
  use McrmWeb, :live_component
  require Logger
  alias Mcrm.Templates

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
      </.header>

      <.simple_form
        for={%{}}
        id="render_template-form"
        phx-target={@myself}
        phx-submit="render"
      >
      <.input
          value="1"
          name="template_id"
          type="select"
          label={"Template"}
          options={Templates.list_mailtemplate_options()}
        />
        <:actions>
          <.button phx-disable-with="Rendering...">Generate</.button>
        </:actions>
      </.simple_form>

      <p :if={assigns[:rendered_template]}>{@rendered_template}</p>
    </div>
    """
  end

  @impl true
  def handle_event("render", %{"template_id" => template_id}, socket) do
    render_template(socket, template_id)
  end

  defp render_template(socket, template_id) do
    case Templates.render_template(template_id) do
      {:ok, result} ->
        {:noreply,
         assign(socket, rendered_template: result)}

      {:error, error_message} ->
        {:noreply, put_flash(socket, :error, error_message)}
    end
  end
end
