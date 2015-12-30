module EstimoteApi
  class Beacon
    include HTTParty

    base_uri    EstimoteApi::Cloud.url
    headers     'Accept' => 'application/json'


    def self.all(app_id, app_token)
      options = { basic_auth: { username: app_id, password: app_token } }

      get('/beacons', options)
    end
  end
end