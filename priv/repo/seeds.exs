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
  staff1 = Repo.insert!(%Staff{code: "s1", name: "Staff 1"})
  staff2 = Repo.insert!(%Staff{code: "s2", name: "Staff 2"})

  customers = [
    %Customer{
      address: "address 1",
      code: "c1",
      name: "Customer 1",
      phone_number: "111-111-1111",
      staff_id: staff1.id
    },
    %Customer{
      address: "address 2",
      code: "c2",
      name: "Customer 2",
      phone_number: "222-222-2222",
      staff_id: staff2.id
    },
    %Customer{
      address: "address 3",
      code: "c3",
      name: "Customer 3",
      phone_number: "333-333-3333",
      staff_id: staff1.id
    },
    %Customer{
      address: "address 4",
      code: "c4",
      name: "Customer 4",
      phone_number: "444-444-4444",
      staff_id: nil
    }
  ]

  customers
  |> Enum.each(fn x ->
    Repo.insert!(x)
  end)

  :ok
end)
