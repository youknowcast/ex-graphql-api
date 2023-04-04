defmodule Api.Good do
  use Ecto.Schema
  import Ecto.Changeset

  schema "goods" do
    field(:code, :string)
    field(:name, :string)
    field(:price, :decimal)

    has_many(:order_details, Api.OrderDetail)

    timestamps()
  end

  @doc false
  def changeset(good, attrs) do
    good
    |> cast(attrs, [:code, :name, :price])
    |> validate_required([:code, :name, :price])
  end
end
