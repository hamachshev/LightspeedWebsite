class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :product, null: false, foreign_key: true
      t.references :customer, null: false
      t.references :address, null: false, foreign_key: true
      t.references :shipper, null: false

      t.timestamps
    end

    add_foreign_key :orders, :users, column: :customer_id
    add_foreign_key :orders, :users, column: :shipper_id
  end
end
