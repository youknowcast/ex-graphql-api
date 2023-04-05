defmodule Api.Schema do
  use Absinthe.Schema

  import_types(ApiWeb.Graphql.Types.{CustomerType, StaffType})

  query do
    field :all_customers, list_of(:customer) do
      resolve(&ApiWeb.Graphql.Resolvers.CustomerResolver.all/2)
    end
  end

  mutation do
    field :create_staff, :staff do
      arg(:params, non_null(:staff_input))
      resolve(&ApiWeb.GraphQL.Mutations.create_staff/1)
    end
  end
end
