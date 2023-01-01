defmodule Api.Stock do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stocks" do
    field :depot_code, :string
    field :goods_code, :string
    field :quantity, :integer

    timestamps()
  end

  @doc false
  def changeset(stock, attrs) do
    stock
    |> cast(attrs, [])
    |> validate_required([])
  end
end
