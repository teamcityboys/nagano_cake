class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :price
      t.integer :quantity
      t.integer :making_status,default:0
      t.datetime :created_at
      t.datetime :update_at

      t.timestamps
    end
  end
end
