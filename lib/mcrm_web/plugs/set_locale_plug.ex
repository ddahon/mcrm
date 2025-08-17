defmodule McrmWeb.Plugs.SetLocale do
  import Plug.Conn # 1

  @supported_locales Gettext.known_locales(McrmWeb.Gettext) # 2

  def init(_options), do: nil # 3

  def call(%Plug.Conn{params: %{"locale" => locale}} = conn, _options) when locale in @supported_locales do #  4
    McrmWeb.Gettext |> Gettext.put_locale(locale)
    conn
  end

  def call(conn, _options), do: conn # 5
end
