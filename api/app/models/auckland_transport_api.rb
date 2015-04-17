class AucklandTransportApi

  def self.stops
    request('stops')
  end

  protected

  def self.request(resource)
    conn = Faraday.new(:url => 'https://api.at.govt.nz')
    response = conn.get("/v1/gtfs/#{resource}?api_key=615c28df-5d93-4ced-81b5-c620e45e40af")
    response = JSON.parse(response.body)
  end

end
