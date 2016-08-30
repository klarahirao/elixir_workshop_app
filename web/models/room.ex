defmodule ElixirWorkshopApp.Room do
  use ElixirWorkshopApp.Web, :model

  schema "rooms" do
    field :name, :string

    has_many :messages, ElixirWorkshopApp.Message
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
