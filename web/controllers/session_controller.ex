defmodule ElixirWorkshopApp.SessionController do
  use ElixirWorkshopApp.Web, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end
end