defmodule ElixirWorkshopApp.Message do
  use ElixirWorkshopApp.Web, :model

  schema "messages" do
    field :body, :string
    belongs_to :user, ElixirWorkshopApp.User
    belongs_to :room, ElixirWorkshopApp.Room

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:body, :user_id, :room_id])
    |> validate_required([:body])
  end
end
