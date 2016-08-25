defmodule ElixirWorkshopApp.RegistrationController do
  use ElixirWorkshopApp.Web, :controller
  alias ElixirWorkshopApp.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end
end