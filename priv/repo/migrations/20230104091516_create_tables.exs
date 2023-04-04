defmodule MyApi.Repo.Migrations.CreateTables do
  use Ecto.Migration

  def change do
    create table(:staffs) do
      add :code, :string
      add :name, :string
      add :inserted_at, :utc_datetime
      add :updated_at, :utc_datetime
    end
    create table(:customers) do
      add :address, :string
      add :code, :string
      add :name, :string
      add :phone_number, :string
      add :staff_code, :string
      add :inserted_at, :utc_datetime
      add :updated_at, :utc_datetime
    end
    create index "index_customers_on_phone_number", [:phone_number], unique: true
    create table(:orders) do
      add :code, :string
      add :customer_code, :string
      add :date, :date
      add :inserted_at, :utc_datetime
      add :updated_at, :utc_datetime
    end
    create index "index_orders_on_date_and_customer_code", [:date,:customer_code]
    create table(:order_details) do
      add :goods_code, :string
      add :order_code, :string
      add :quantity, :integer
      add :sequence, :integer
      add :inserted_at, :utc_datetime
      add :updated_at, :utc_datetime
    end
    create table(:goods) do
      add :code, :string
      add :name, :string
      add :price, :integer
      add :inserted_at, :utc_datetime
      add :updated_at, :utc_datetime
    end
    create table(:stocks) do
      add :depot_code, :string
      add :goods_code, :string
      add :quantity, :integer
      add :inserted_at, :utc_datetime
      add :updated_at, :utc_datetime
    end
    create table(:depots) do
      add :code, :string
      add :name, :string
      add :inserted_at, :utc_datetime
      add :updated_at, :utc_datetime
    end
  end
end