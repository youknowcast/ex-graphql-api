defmodule ApiWeb.Graphql.Resolvers.DepotResolver do
  alias ApiWeb.Graphql.Types.DepotType

  alias Api.Repo
  alias Api.Depot

  def all(_args, _info) do
    values =
      Repo.all(Depot)
      |> Enum.map(&DepotType.depot_to_type/1)

    {:ok, values}
  end
end
