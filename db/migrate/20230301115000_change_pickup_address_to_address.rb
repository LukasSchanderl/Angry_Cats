class ChangePickupAddressToAddress < ActiveRecord::Migration[7.0]
  def change
    rename_column :cats, :pickup_address, :address
  end
end
