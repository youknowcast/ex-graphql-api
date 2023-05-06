defmodule ApiWeb.Schema do
  use Absinthe.Schema

  import_types(ApiWeb.Graphql.Types.Types)

  query do
    field :all_customers, list_of(:customer),
      do: resolve(&ApiWeb.Graphql.Resolvers.CustomerResolver.all/2)

    field :all_staffs, list_of(:staff), do: resolve(&ApiWeb.Graphql.Resolvers.StaffResolver.all/2)

    field :all_goods, list_of(:good), do: resolve(&ApiWeb.Graphql.Resolvers.GoodResolver.all/2)

    field :all_depots, list_of(:depot), do: resolve(&ApiWeb.Graphql.Resolvers.DepotResolver.all/2)
  end

  mutation do
    field :create_staff, :staff do
      resolve(&ApiWeb.Graphql.Resolvers.StaffResolver.create/2)
      arg(:params, non_null(:staff_input))
    end

    field :update_staff, :staff do
      resolve(&ApiWeb.Graphql.Resolvers.StaffResolver.update/2)
      arg(:id, non_null(:id))
      arg(:staff, non_null(:staff_input))
    end

    field :create_customer, :customer do
      resolve(&ApiWeb.Graphql.Resolvers.CustomerResolver.create/2)
      arg(:params, non_null(:customer_input))
    end

    field :create_depot, :depot do
      resolve(&ApiWeb.Graphql.Resolvers.DepotResolver.create/2)
      arg(:params, non_null(:depot_input))
    end
  end
end
