defmodule Api.Schema do
  #  use Absinthe.Schema

  #  import_types Absinthe.Type.Custom
  #  import_types Api.Schema.CustomerTypes

  alias Api.Resolvers

  #  query do
  #    @desc "Get all customers"
  #    field :customers, list_of(:customer) do
  #      resolve(&Resolvers.Customer.list_posts/3)
  #    end
  #  end
end
