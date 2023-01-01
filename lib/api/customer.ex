defmodule Api.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "customers" do
    field :fieldress, :string
    field :code, :string
    field :name, :string
    field :phone_number, :string
    field :staff_code, :string

    timestamps()
  end

  @doc false
  def changeset(customer, attrs) do
    customer
    |> cast(attrs, [])
    |> validate_required([])
  end
end
