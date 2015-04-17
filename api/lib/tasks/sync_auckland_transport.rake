namespace :at do
  desc "Sync Auckland transport stops"
  task :sync_stops => :environment do
    response = AucklandTransportApi.stops
    AucklandTransportApi.create_or_update(response, Stop, :stop_id)
  end

  desc "Sync Auckland transport stop times"
  task :sync_stop_times => :environment do
    #TODO: Find out a way to slowly update stop times over a month to reduce requests
  end
end
