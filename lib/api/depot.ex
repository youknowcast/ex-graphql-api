defmodule Api.Depot do
  use Ecto.Schema
  import Ecto.Changeset

  schema "depots" do
    field :code, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(depot, attrs) do
    depot
    |> cast(attrs, [:code, :name])
    |> validate_required([:code, :name])
  end
end
