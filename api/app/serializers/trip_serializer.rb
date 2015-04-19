class TripSerializer < ActiveModel::Serializer
  attributes :route_id, :service_id, :trip_id, :trip_headsign, :direction_id, :block_id, :shape_id, :trip_short_name, :trip_type, :trip_name

  def trip_name
    _name = object.stop_times.order(:arrival_time).map do |stop_time|
      "#{stop_time.stop.stop_name} (#{stop_time.departure_time})"
    end.join(' - ')
  end
end
