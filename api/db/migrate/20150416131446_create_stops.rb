class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.string :stop_id
      t.string :stop_name
      t.string :stop_desc
      t.decimal :stop_lat
      t.decimal :stop_lon
      t.string :zone_id
      t.string :stop_url
      t.string :stop_code
      t.string :stop_street
      t.string :stop_city
      t.string :stop_region
      t.string :stop_postcode
      t.string :stop_country
      t.string :location_type
      t.string :parent_station
      t.string :stop_timezone
      t.string :wheelchair_boarding
      t.string :direction
      t.string :position
      t.string :the_geom

      t.timestamps null: false
    end
  end
end
