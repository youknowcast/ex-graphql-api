defmodule ApiWeb.Graphql.Mutations.CreateStaff do
  use Absinthe.Schema.Notation

  import_types(ApiWeb.Graphql.Types)

  @desc "Create a new staff"
  def create_staff(params) do
    %Api.Staff{}
    |> Staff.changeset(params)
    |> Repo.insert()
    |> case do
      {:ok, staff} -> {:ok, StaffType.staff_to_type(staff)}
      {:error, changeset} -> {:error, changeset}
    end
  end
end
