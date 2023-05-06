defmodule ApiWeb.Graphql.Resolvers.GoodResolver do
  alias Api.Repo
  alias Api.Good

  alias ApiWeb.Graphql.Types.GoodType

  def all(_args, _info) do
    values =
      Repo.all(Good)
      |> Enum.map(&GoodType.good_to_type/1)

    {:ok, values}
  end

  def create(%{params: params}, _) do
    %Api.Good{}
    |> Good.changeset(params)
    |> Repo.insert()
    |> case do
      {:ok, good} -> {:ok, GoodType.good_to_type(good)}
      {:error, changeset} -> {:error, changeset}
    end
  end

  def update(%{id: id, params: params}, _) do
    good =
      Repo.get(Good, id)
      |> Ecto.Changeset.change(params)

    case Repo.update(good) do
      {:ok, good} ->
        {:ok, good}

      {:error, changeset} ->
        {:error, changeset}
    end
  end
end
