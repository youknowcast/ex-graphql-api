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

alias Api.Repo
alias Api.{Customer, Good, Order, OrderDetail, Staff}

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
  |> Enum.each(&Repo.insert!(&1))

  goods = [
    %Good{code: "G01", name: "Apple", price: 100},
    %Good{code: "G02", name: "Banana", price: 50},
    %Good{code: "G03", name: "Orange", price: 80},
    %Good{code: "G04", name: "Pineapple", price: 200},
    %Good{code: "G05", name: "Grape", price: 120}
  ]

  goods =
    goods
    |> Enum.map(&Repo.insert!(&1))

  order1 = %Order{customer_id: Enum.at(customers, 0).id, date: ~D[2022-04-01]}
  order2 = %Order{customer_id: Enum.at(customers, 1).id, date: ~D[2022-04-02]}
  order3 = %Order{customer_id: Enum.at(customers, 2).id, date: ~D[2022-04-03]}
  order4 = %Order{customer_id: Enum.at(customers, 3).id, date: ~D[2022-04-04]}

  [order1, order2, order3, order4]
  |> Enum.each(&Repo.insert!(&1))

  # OrderDetail レコードを追加する
  order_details = [
    %OrderDetail{order_id: order1.id, good_id: Enum.at(goods, 0).id, quantity: 2, price: 200},
    %OrderDetail{order_id: order1.id, good_id: Enum.at(goods, 1).id, quantity: 3, price: 150},
    %OrderDetail{order_id: order2.id, good_id: Enum.at(goods, 2).id, quantity: 1, price: 80},
    %OrderDetail{order_id: order3.id, good_id: Enum.at(goods, 4).id, quantity: 5, price: 600},
    %OrderDetail{order_id: order4.id, good_id: Enum.at(goods, 3).id, quantity: 2, price: 400}
  ]

  order_details
  |> Enum.each(&Repo.insert!(&1))

  :ok
end)
