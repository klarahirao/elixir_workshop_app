defmodule ElixirWorkshopApp.RoomController do
  use ElixirWorkshopApp.Web, :controller
  alias ElixirWorkshopApp.Room
  alias ElixirWorkshopApp.Message
  import Ecto.Query, only: [from: 2]

  plug ElixirWorkshopApp.Plugs.Authenticate

  def index(conn, _params) do
    rooms = Repo.all(Room)
    render(conn, "index.html", rooms: rooms)
  end

  def show(conn, %{ "id" => id }) do
    query = from m in Message, where: m.room_id == ^id
    messages = Repo.all(query)
    |> Repo.preload :user
    render(conn, :show, room_id: id, messages: messages)
  end

  def new(conn, _params) do
    changeset = Room.changeset(%Room{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"room" => room_params}) do
    changeset = Room.changeset(%Room{}, room_params)

    case Repo.insert(changeset) do
      {:ok, _room} ->
        conn
        |> put_flash(:info, "Room created successfully.")
        |> redirect(to: room_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    room = Repo.get!(Room, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(room)

    conn
    |> put_flash(:info, "Room deleted successfully.")
    |> redirect(to: room_path(conn, :index))
  end
end
