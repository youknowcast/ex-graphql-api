defmodule Api.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :code, :string
    field :customer_code, :string
    field :date, :date

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [])
    |> validate_required([])
  end
end
