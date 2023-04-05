defmodule ApiWeb.Schema do
  use Absinthe.Schema

  import_types(ApiWeb.Graphql.Types.Types)

  query do
    field :all_customers, list_of(:customer),
      do: resolve(&ApiWeb.Graphql.Resolvers.CustomerResolver.all/2)

    field :all_staffs, list_of(:staff), do: resolve(&ApiWeb.Graphql.Resolvers.StaffResolver.all/2)
  end

  mutation do
    field :create_staff, :staff do
      resolve(&ApiWeb.Graphql.Resolvers.StaffResolver.create/2)
      arg(:params, non_null(:staff_input))
    end

    field :create_customer, :customer do
      resolve(&ApiWeb.Graphql.Resolvers.CustomerResolver.create/2)
      arg(:params, non_null(:customer_input))
    end
  end
end
