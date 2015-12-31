module KontaktApi
  class Cloud
    include HTTParty

    base_uri    'http://api.kontakt.io'
    headers     'Accept' => 'application/vnd.com.kontakt+json;version=6'

    def initialize(opts = {})
      @options = { headers: { 'Api-Key' => opts[:api_key] } }

      self
    end

    def beacons
      response = self.class.get('/device', @options)

      JSON.parse(response)['devices'] rescue nil
    end
  end
end