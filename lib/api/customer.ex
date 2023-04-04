defmodule Api.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "customers" do
    field(:address, :string)
    field(:code, :string)
    field(:name, :string)
    field(:phone_number, :string)
    belongs_to(:staff, Api.Staff, foreign_key: :staff_id)

    timestamps()
  end

  @doc false
  def changeset(customer, attrs) do
    customer
    |> cast(attrs, [:address, :code, :name, :phone_number, :staff_id])
    |> validate_required([:code, :name])
  end
end
