class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :porstal_code
      t.string :address
      t.string :name
      t.integer :freight
      t.integer :charge
      t.integer :payment_method,default:0
      t.integer :order_status,default:0
      t.datetime :created_at
      t.datetime :update_at

      t.timestamps
    end
  end
end
