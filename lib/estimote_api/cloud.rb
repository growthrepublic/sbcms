module EstimoteApi
  class Cloud
    include HTTParty

    base_uri    'https://cloud.estimote.com/v1/'
    headers     'Accept' => 'application/json'


    def initialize(opts = {})
      @options = { basic_auth: { username: opts[:app_id], password: opts[:app_token] } }

      self
    end

    def beacons
      self.class.get('/beacons', @options)
    end
  end
end