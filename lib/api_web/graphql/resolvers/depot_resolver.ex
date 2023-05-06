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

  def create(%{params: params}, _) do
    %Api.Depot{}
    |> Depot.changeset(params)
    |> Repo.insert()
    |> case do
      {:ok, depot} -> {:ok, DepotType.depot_to_type(depot)}
      {:error, changeset} -> {:error, changeset}
    end
  end

  def update(%{id: id, params: params}, _) do
    depot =
      Repo.get(Depot, id)
      |> Ecto.Changeset.change(params)

    case Repo.update(depot) do
      {:ok, depot} ->
        {:ok, depot}

      {:error, changeset} ->
        {:error, changeset}
    end
  end
end
