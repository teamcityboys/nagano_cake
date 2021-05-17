class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :last_name
      t.string :first_name
      t.string :first_name_kana
      t.string :last_name_kana
      t.boolean :is_deleted,default:false
      t.text :address
      t.string :email
      t.string :porstal_code
      t.string :phone_number
      t.string :encrypted_password
      t.datetime :created_at
      t.datetime :update_at

      t.timestamps
    end
  end
end
