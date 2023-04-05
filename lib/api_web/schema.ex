defmodule Api.Schema do
  use Absinthe.Schema

  import_types(ApiWeb.Graphql.Types.{CustomerType, StaffType})

  query do
    field :all_customers, list_of(:customer) do
      resolve(&ApiWeb.Graphql.Resolvers.CustomerResolver.all/2)
    end

    field :all_staffs, list_of(:staff) do
      resolve(&ApiWeb.Graphql.Resolvers.StaffResolver.all/2)
    end
  end

  mutation do
    field :create_staff, :staff do
      arg(:params, non_null(:staff_input))
      resolve(&ApiWeb.Graphql.Mutations.CreateStaff.create/2)
    end
  end

  input_object :staff_input do
    field :code, :string
    field :name, :string
  end
end
