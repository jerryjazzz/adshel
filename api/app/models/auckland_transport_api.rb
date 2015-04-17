class AucklandTransportApi

  def self.stop_times(stop_id)
    request("stopTimes/stopId/#{stop_id}")
  end

  def self.stops
    request('stops')
  end

  def self.trips
    request('trips')
  end

  def self.create_or_update(response, model, id_name)
    if response["status"] == "OK"
      response["response"].each do |instance|
        existing = model.find_by(id_name => instance[id_name.to_s])
        if existing.present?
          existing.update_attributes(instance)
        else
          model.create(instance)
        end
      end
      puts "#{response["response"].count} #{model.class.name.downcase} updated."
    else
      raise "Stops API returned: #{response["error"]}"
    end
  end

  protected

  def self.request(resource)
    conn = Faraday.new(:url => 'https://api.at.govt.nz')
    response = conn.get("/v1/gtfs/#{resource}?api_key=615c28df-5d93-4ced-81b5-c620e45e40af")
    response = JSON.parse(response.body)
  end

end
