defmodule Api.OrderTest do
  use ApiWeb.ConnCase, async: true

  import Api.DataCase
  alias Api.{Repo, Customer, Order, OrderDetail}

  describe "changeset/2" do
    test "validates required fields" do
      changeset = Order.changeset(%Order{}, %{})
      assert {:error, changeset} = Repo.insert(changeset)
      errors = errors_on(changeset) |> Map.keys()
      assert ^errors = [:customer_id, :date, :order_details]
    end

    test "validates a valid user" do
      changeset =
        Order.changeset(%Order{}, %{
          customer: %Customer{code: "a", name: "A"},
          date: ~D[2022-04-01],
          order_details: [%{quantity: 1, price: 200}]
        })

      assert %{} = errors_on(changeset)
    end
  end
end
