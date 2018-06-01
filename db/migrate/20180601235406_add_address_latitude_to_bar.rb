class AddAddressLatitudeToBar < ActiveRecord::Migration[5.0]
  def change
    add_column :bars, :address_latitude, :float
  end
end
