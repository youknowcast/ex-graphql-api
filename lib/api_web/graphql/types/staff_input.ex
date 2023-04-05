defmodule ApiWeb.Graphql.Types.StaffInput do
  use Absinthe.Schema.Notation

  input_object :staff_input do
    field :code, non_null(:string)
    field :name, non_null(:string)
  end
end
