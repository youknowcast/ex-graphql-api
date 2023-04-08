defmodule Api.Stock do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stocks" do
    belongs_to(:good, Api.Good, foreign_key: :good_id)
    belongs_to(:depot, Api.Depot, foreign_key: :depot_id)
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
