defmodule ElixirWorkshopApp.RoomChannelTest do
  use ElixirWorkshopApp.ChannelCase

  alias ElixirWorkshopApp.RoomChannel
  alias ElixirWorkshopApp.User
  alias ElixirWorkshopApp.Room
  alias ElixirWorkshopApp.Repo
  alias ElixirWorkshopApp.UserSocket

  test "new_msg broadcasts message" do
    # Given
    room = Room.changeset(%Room{}, %{name: "Room Name"}) |> Repo.insert!
    user = User.changeset(%User{}, %{email: "email@example.com", password: "password"}) |> Repo.insert!

    # When
    {:ok, socket} = connect(UserSocket, %{})
    {:ok, _, socket} = subscribe_and_join(socket, RoomChannel, "room:#{room.id}")

    message = %{"body" => "body", "user" => user.email, "room_id" => room.id}
    push socket, "new_msg", message

    # Then
    response = %{body: message["body"], user: user.email}
    assert_broadcast "new_msg", ^response
  end
end
