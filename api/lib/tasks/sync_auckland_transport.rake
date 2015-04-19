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

  desc "Sync Auckland transport trips"
  task :sync_trips => :environment do
    response = AucklandTransportApi.trips
    AucklandTransportApi.create_or_update(response, Trip, :trip_id)
  end

  desc "Sync Auckland transport routes"
  task :sync_routes => :environment do
    response = AucklandTransportApi.routes
    AucklandTransportApi.create_or_update(response, Route, :route_id)
  end

  desc "Sync Auckland transport routes"
  task :sync_everything => :environment do
    %x[rake at:sync_stops]
    %x[rake at:sync_trips]
    %x[rake at:sync_routes]
  end
end
