class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.integer :mamber_id
      t.string :porstal_code
      t.string :address
      t.text :name
      t.datetime :created_at
      t.datetime :update_at

      t.timestamps
    end
  end
end
