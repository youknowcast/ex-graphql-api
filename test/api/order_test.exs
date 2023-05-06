defmodule Api.OrderTest do
  use ApiWeb.ConnCase, async: true

  import Api.DataCase
  alias Api.{Repo, Customer, Order, OrderDetail, Good}

  describe "changeset/2" do
    setup do
      {:ok, good} = Repo.insert(%Good{code: "g", name: "G", price: 100})
      {:ok, good: good}
    end

    test "validates required fields" do
      changeset = Order.changeset(%Order{}, %{})
      assert {:error, changeset} = Repo.insert(changeset)
      errors = errors_on(changeset) |> Map.keys()
      assert ^errors = [:customer_id, :date, :order_details]
    end

    test "validates valid customer", %{good: good} do
      changeset =
        Order.changeset(%Order{}, %{
          customer_id: 999,
          date: ~D[2022-04-01],
          order_details: [
            %{quantity: 1, price: 200, good_id: good.id}
          ]
        })

      assert {:error, changeset} = Repo.insert(changeset)
      errors = errors_on(changeset) |> Map.keys()
      assert ^errors = [:customer]
    end

    test "validates a valid user", %{good: good} do
      changeset =
        Order.changeset(%Order{}, %{
          customer: %{code: "a", name: "A"},
          date: ~D[2022-04-01],
          order_details: [%{quantity: 1, price: 200, good_id: good.id}]
        })

      assert {:error, changeset} = Repo.insert(changeset)
      assert %{} = errors_on(changeset)
    end
  end
end
