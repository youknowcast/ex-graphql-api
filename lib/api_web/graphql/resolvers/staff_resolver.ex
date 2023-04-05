defmodule ApiWeb.Graphql.Resolvers.StaffResolver do
  import Ecto.Query

  alias Api.{Repo, Staff}
  alias ApiWeb.Graphql.Types.StaffType

  @doc false
  @spec all(any, any) :: {:ok, any}
  def all(_args, _info) do
    {:ok, Repo.all(Staff)}
  end

  @doc false
  def create(%{params: params}, _) do
    %Api.Staff{}
    |> Staff.changeset(params)
    |> Repo.insert()
    |> case do
      {:ok, staff} -> {:ok, StaffType.staff_to_type(staff)}
      {:error, changeset} -> {:error, changeset}
    end
  end
end
