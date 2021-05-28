class ChangeDestinationsToAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_table :destinations, :addresses
  end
end
