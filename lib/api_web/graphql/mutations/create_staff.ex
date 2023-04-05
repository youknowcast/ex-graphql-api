defmodule ApiWeb.Graphql.Mutations.CreateStaff do
  use Absinthe.Schema.Notation

  alias Api.{Repo, Staff}
  alias ApiWeb.Graphql.Types.StaffType

  @desc "Create a new staff"
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
