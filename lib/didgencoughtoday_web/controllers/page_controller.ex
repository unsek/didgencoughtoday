defmodule DidgencoughtodayWeb.PageController do
  use DidgencoughtodayWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
