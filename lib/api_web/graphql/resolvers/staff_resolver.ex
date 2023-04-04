defmodule ApiWeb.Graphql.Resolvers.StaffResolver do
  import Ecto.Query

  alias Api.Repo
  alias Api.Staff

  def all(_args, _info) do
    {:ok, Repo.all(Staff)}
  end
end
