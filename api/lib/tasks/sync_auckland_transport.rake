namespace :at do
  desc "Sync Auckland transport stops"
  task :sync_stops => :environment do
    response = AucklandTransportApi.stops

    if response["status"] == "OK"
      response["response"].each do |stop|
        existing_stop = Stop.find_by(stop_id: stop["stop_id"])
        if existing_stop.present?
          existing_stop.update_attributes(stop)
        else
          Stop.create(stop)
        end
      end
      puts "#{response["response"].count} Stops updated."
    else
      raise "Stops API returned: #{response["error"]}"
    end
  end
end
