class CreateDrinkOrders < ActiveRecord::Migration
  def change
    create_table :drink_orders do |t|
      t.integer :drink_id
      t.integer :bar_id

      t.timestamps

    end
  end
end
