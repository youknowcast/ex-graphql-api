defmodule Api.OrderDetail do
  use Ecto.Schema
  import Ecto.Changeset

  schema "order_details" do
    field :goods_code, :string
    field :order_code, :string
    field :quantity, :integer
    field :sequence, :integer

    timestamps()
  end

  @doc false
  def changeset(order_detail, attrs) do
    order_detail
    |> cast(attrs, [])
    |> validate_required([])
  end
end
