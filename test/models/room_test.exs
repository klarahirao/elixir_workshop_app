defmodule ElixirWorkshopApp.RoomTest do
  use ElixirWorkshopApp.ModelCase

  alias ElixirWorkshopApp.Room

  @valid_attrs %{name: "name"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Room.changeset(%Room{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Room.changeset(%Room{}, @invalid_attrs)
    refute changeset.valid?
  end
end
