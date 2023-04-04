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
      add(:staff_id, references(:staffs, on_delete: :nothing))
      add(:inserted_at, :utc_datetime)
      add(:updated_at, :utc_datetime)
    end

    create(index(:customers, [:code], unique: true))

    create table(:orders) do
      add(:code, :string)
      add(:customer_code, :string)
      add(:date, :date)
      add(:inserted_at, :utc_datetime)
      add(:updated_at, :utc_datetime)
    end

    create table(:order_details) do
      add(:goods_code, :string)
      add(:order_code, :string)
      add(:quantity, :integer)
      add(:sequence, :integer)
      add(:inserted_at, :utc_datetime)
      add(:updated_at, :utc_datetime)
    end

    create table(:goods) do
      add(:code, :string)
      add(:name, :string)
      add(:price, :integer)
      add(:inserted_at, :utc_datetime)
      add(:updated_at, :utc_datetime)
    end

    create table(:stocks) do
      add(:depot_code, :string)
      add(:goods_code, :string)
      add(:quantity, :integer)
      add(:inserted_at, :utc_datetime)
      add(:updated_at, :utc_datetime)
    end

    create table(:depots) do
      add(:code, :string)
      add(:name, :string)
      add(:inserted_at, :utc_datetime)
      add(:updated_at, :utc_datetime)
    end
  end
end
