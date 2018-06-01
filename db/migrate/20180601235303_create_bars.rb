class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :name
      t.string :address
      t.string :style
      t.string :cuisine
      t.time :happy_hour_start_time
      t.time :happy_hour_end_time
      t.float :latitude
      t.float :longitude

      t.timestamps

    end
  end
end
