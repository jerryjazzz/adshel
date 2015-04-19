class StopTimeSerializer < ActiveModel::Serializer
  attributes :trip_id, :arrival_time, :departure_time, :stop_id, :stop_sequence, :stop_headsign, :pickup_type, :drop_off_type, :shape_dist_traveled, :timepoint, :arrival_time_seconds, :departure_time_seconds, :trip_headsign, :stop_name

  def trip_headsign
    object.trip.trip_headsign if object.trip
  end

  def stop_name
    object.stop.stop_name if object.stop
  end
end
