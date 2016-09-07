defmodule ElixirWorkshopApp.Plugs.Authenticate do
  import Plug.Conn
  import ElixirWorkshopApp.Router.Helpers
  import Phoenix.Controller, only: [put_flash: 3, redirect: 2]
  import ElixirWorkshopApp.Session, only: [current_user: 1]

  def init(default), do: default

  def call(conn, default) do
    if current_user(conn) do
      conn
    else
      conn
      |> put_flash(:error, 'You need to be signed in to view this page')
      |> redirect(to: session_path(conn, :new))
      |> halt
    end
  end
end