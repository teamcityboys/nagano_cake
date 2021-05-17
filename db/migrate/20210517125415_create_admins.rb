class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :email
      t.string :password
      t.datetime :created_at
      t.datetime :update_at

      t.timestamps
    end
  end
end
