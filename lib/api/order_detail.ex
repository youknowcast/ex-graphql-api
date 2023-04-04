defmodule Api.OrderDetail do
  use Ecto.Schema
  import Ecto.Changeset

  schema "order_details" do
    belongs_to(:order, Api.Order)
    belongs_to(:good, Api.Good)
    field(:quantity, :integer)
    field(:price, :decimal)

    timestamps()
  end

  @doc false
  def changeset(order_detail, attrs) do
    order_detail
    |> cast(attrs, [:order_id, :good_id, :quantity, :price])
    |> validate_required([:order_id, :good_id, :quantity, :price])
  end
end
