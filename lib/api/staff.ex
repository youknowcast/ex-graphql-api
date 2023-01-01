defmodule Api.Staff do
  use Ecto.Schema
  import Ecto.Changeset

  schema "staffs" do
    field :code, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(staff, attrs) do
    staff
    |> cast(attrs, [])
    |> validate_required([])
  end
end
