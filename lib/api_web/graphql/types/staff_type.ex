defmodule ApiWeb.Graphql.Types.StaffType do
  use Absinthe.Schema.Notation

  object :staff do
    field(:id, non_null(:id))
    field(:code, non_null(:string))
    field(:name, non_null(:string))
  end

  def staff_to_type(nil), do: nil

  def staff_to_type(%Api.Staff{} = staff) do
    %{
      id: staff.id,
      name: staff.name,
      code: staff.code
    }
  end
end
