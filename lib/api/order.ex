defmodule Api.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    belongs_to(:customer, Api.Customer)
    field(:date, :date)

    has_many(:order_details, Api.OrderDetail)

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:customer_id, :date])
    |> validate_required([:customer_id, :date])
  end
end
