defmodule ApiWeb.Graphql.Types.GoodType do
  use Absinthe.Schema.Notation

  import_types(Absinthe.Type.Custom)

  object :good do
    field(:id, non_null(:id))
    field(:code, non_null(:string))
    field(:name, non_null(:string))
    field(:price, non_null(:decimal))
  end

  def good_to_type(%Api.Good{} = good) do
    %{
      id: good.id,
      name: good.name,
      code: good.code,
      price: good.price
    }
  end
end
