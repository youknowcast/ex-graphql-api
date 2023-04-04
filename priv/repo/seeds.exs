# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Api.Repo.insert!(%Api.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Api.{Repo, Customer, Staff}

Repo.transaction(fn ->
  # Staffのデータを流し込み
  staff = %Staff{code: "001", name: "John Doe"}
  Repo.insert!(staff)

  # Customerのデータを流し込み
  customer = %Customer{
    address: "東京都渋谷区",
    code: "C001",
    name: "株式会社テスト",
    phone_number: "000-0000-0000",
    staff_id: staff.id
  }

  Repo.insert!(customer)

  :ok
end)
