defmodule ApiWeb.Graphql.Types.DepotType do
  use Absinthe.Schema.Notation

  object :depot do
    field(:id, non_null(:id))
    field(:code, non_null(:string))
    field(:name, non_null(:string))
  end

  def depot_to_type(%Api.Depot{} = depot) do
    %{
      id: depot.id,
      name: depot.name,
      code: depot.code
    }
  end
end
