defmodule ElixirWorkshopApp.UserTest do
  use ElixirWorkshopApp.ModelCase

  alias ElixirWorkshopApp.User

  @valid_attrs %{email: "email@example.com", password: "password"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
