defmodule ApiWeb.Graphql.Resolvers.CustomerResolver do
  import Ecto.Query

  alias Api.Repo
  alias Api.Customer

  alias ApiWeb.Graphql.Types.CustomerType

  def all(_args, _info) do
    values =
      Repo.all(Customer)
      |> Repo.preload(:staff)
      |> Enum.map(&CustomerType.customer_to_type/1)

    {:ok, values}
  end
end
