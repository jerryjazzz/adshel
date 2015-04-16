namespace :at do
  desc "Sync Auckland transport stops"
  task :sync_stops => :environment do
    conn = Faraday.new(:url => 'https://api.at.govt.nz')
    response = conn.get '/v1/gtfs/stops?api_key=615c28df-5d93-4ced-81b5-c620e45e40af'
    response = JSON.parse(response.body)

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
