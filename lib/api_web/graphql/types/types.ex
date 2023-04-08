defmodule ApiWeb.Graphql.Types.Types do
  @moduledoc """
  GraphQL の各 input, type などを集約して管理します．

  type などを実装した場合，本 module 上で `import_types()` するようにしてください．
  本 module が集約した定義は ApiWeb.Schema にロードされ，各 query, mutation で参照されます．
  """

  alias ApiWeb.Graphql.Types.DepotType
  alias ApiWeb.Graphql.Types.GoodType
  alias ApiWeb.Graphql.Types.StaffInput
  alias ApiWeb.Graphql.Types.StaffType
  alias ApiWeb.Graphql.Types.CustomerType

  use Absinthe.Schema.Notation

  import_types(CustomerType)
  import_types(StaffType)
  import_types(StaffInput)
  import_types(GoodType)
  import_types(DepotType)
end
