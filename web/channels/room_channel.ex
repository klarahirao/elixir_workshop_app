defmodule ElixirWorkshopApp.RoomChannel do
  use Phoenix.Channel

  def join("room:" <> _room_name, _params, socket) do
    {:ok, socket}
  end

  def handle_in("new_msg", %{"body" => body, "user" => user, "room_id" => room_id}, socket) do
    create_message(body, user, room_id)
    broadcast! socket, "new_msg", %{body: body, user: user}
    {:noreply, socket}
  end

  defp create_message(body, user, room_id) do
    user = ElixirWorkshopApp.Repo.get_by!(ElixirWorkshopApp.User, email: user)
    params = %{user_id: user.id, room_id: room_id, body: body}
    ElixirWorkshopApp.Message.changeset(%ElixirWorkshopApp.Message{}, params)
    |> ElixirWorkshopApp.Repo.insert!
  end
end
