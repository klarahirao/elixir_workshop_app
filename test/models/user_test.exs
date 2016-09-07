defmodule ElixirWorkshopApp.UserTest do
  use ElixirWorkshopApp.ModelCase

  alias ElixirWorkshopApp.User

  @valid_attrs %{password: "password", email: "john@example.com"}
  @invalid_attrs %{password: "pass", email: "john"}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid password" do
    changeset = User.changeset(%User{}, @invalid_attrs)

    assert changeset.errors[:password] == {"should be at least %{count} character(s)", [count: 5]}
    assert changeset.errors[:email] == {"has invalid format", []}
  end
end
