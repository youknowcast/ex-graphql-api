defmodule Api.Schema do
  use Absinthe.Schema

  import_types(ApiWeb.Graphql.Types.CustomerType)
  import_types(ApiWeb.Graphql.Types.StaffType)

  query do
    field :all_customers, list_of(:customer) do
      resolve(&ApiWeb.Graphql.Resolvers.CustomerResolver.all/2)
    end
  end
end
