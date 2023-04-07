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
end
