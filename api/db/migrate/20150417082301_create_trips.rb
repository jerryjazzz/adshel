class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :route_id
      t.string :service_id
      t.string :trip_id
      t.string :trip_headsign
      t.string :direction_id
      t.string :block_id
      t.string :shape_id
      t.string :trip_short_name
      t.string :trip_type

      t.timestamps null: false
    end
  end
end
