defmodule Mix.Tasks.GenerateGraphqlSchema do
  use Mix.Task

  @shortdoc "Sends a greeting to us from Hello Phoenix"

  @moduledoc """
  This is where we would put any long form documentation and doctests.
  """

  @graphql_schema_file "schema.gql"

  @impl Mix.Task
  def run(_args) do
    File.write(@graphql_schema_file, Absinthe.Schema.to_sdl(ApiWeb.Schema))

    Mix.shell().info("generated.")
  end

  # We can define other functions as needed here.
end
