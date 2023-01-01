defmodule Api.Good do
  use Ecto.Schema
  import Ecto.Changeset

  schema "goods" do
    field :code, :string
    field :name, :string
    field :price, :integer

    timestamps()
  end

  @doc false
  def changeset(good, attrs) do
    good
    |> cast(attrs, [])
    |> validate_required([])
  end
end
