class AddAddressLongitudeToBar < ActiveRecord::Migration[5.0]
  def change
    add_column :bars, :address_longitude, :float
  end
end
