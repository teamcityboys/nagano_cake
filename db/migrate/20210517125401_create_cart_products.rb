class CreateCartProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_products do |t|
      t.integer :product_id
      t.integer :member_id
      t.integer :quantity
      t.datetime :created_at
      t.datetime :update_at

      t.timestamps
    end
  end
end
