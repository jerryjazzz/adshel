class StopSerializer < ActiveModel::Serializer
  root nil
  attributes :stop_id, :stop_name, :stop_desc, :stop_lat, :stop_lon, :zone_id, :stop_url, :stop_code, :stop_street, :stop_city, :stop_region, :stop_postcode, :stop_country, :location_type, :parent_station, :stop_timezone, :wheelchair_boarding, :direction, :position, :the_geom
end
