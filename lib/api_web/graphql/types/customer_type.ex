defmodule ApiWeb.Graphql.Types.CustomerType do
  use Absinthe.Schema.Notation

  alias ApiWeb.Graphql.Types.StaffType

  object :customer do
    field(:id, non_null(:id))
    field(:code, non_null(:string))
    field(:name, non_null(:string))
    field(:address, :string)
    field(:phone_number, :string)
    field(:staff, :staff)
  end

  input_object :customer_input do
    field :code, non_null(:string)
    field :name, non_null(:string)
    field(:address, :string)
    field(:phone_number, :string)
    field(:staff_id, :id)
  end

  def customer_to_type(%Api.Customer{} = customer) do
    %{
      id: customer.id,
      name: customer.name,
      code: customer.code,
      address: customer.address,
      phone_number: customer.phone_number,
      staff: StaffType.staff_to_type(customer.staff)
    }
  end
end
