defmodule MyApi.Repo.Migrations.CreateTables do
  use Ecto.Migration

  def change do
    create table(:staffs) do
      add(:code, :string)
      add(:name, :string)
      add(:inserted_at, :utc_datetime)
      add(:updated_at, :utc_datetime)
    end

    create(index(:staffs, [:code], unique: true))

    create table(:customers) do
      add(:address, :string)
      add(:code, :string)
      add(:name, :string)
      add(:phone_number, :string)
      add(:staff_id, references(:staffs, on_delete: :nothing), null: true)
      add(:inserted_at, :utc_datetime)
      add(:updated_at, :utc_datetime)
    end

    create(index(:customers, [:code], unique: true))

    create table(:orders) do
      add(:date, :date)
      add(:customer_id, references(:customers))
      add(:inserted_at, :utc_datetime)
      add(:updated_at, :utc_datetime)
    end

    create table(:goods) do
      add(:code, :string, null: false)
      add(:name, :string, null: false)
      add(:price, :decimal, default: 0, null: false, precision: 10, scale: 2)
      add(:inserted_at, :utc_datetime)
      add(:updated_at, :utc_datetime)
    end

    create table(:order_details) do
      add(:good_id, references(:goods))
      add(:order_id, references(:orders))
      add(:quantity, :integer)
      add(:price, :decimal, default: 0, null: false, precision: 10, scale: 2)
      add(:inserted_at, :utc_datetime)
      add(:updated_at, :utc_datetime)
    end

    create table(:depots) do
      add(:code, :string)
      add(:name, :string)
      add(:inserted_at, :utc_datetime)
      add(:updated_at, :utc_datetime)
    end

    create table(:stocks) do
      add(:depot_id, references(:depots))
      add(:good_id, references(:goods))
      add(:quantity, :integer)
      add(:inserted_at, :utc_datetime)
      add(:updated_at, :utc_datetime)
    end

    create(index(:stocks, [:depot_id, :good_id], unique: true))
  end
end
