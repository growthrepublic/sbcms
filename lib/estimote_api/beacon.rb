module EstimoteApi
  class Beacon
    include HTTParty

    APP_ID    = Rails.application.secrets.beacon_providers['estimote']['app_id']
    APP_TOKEN = Rails.application.secrets.beacon_providers['estimote']['app_token']

    base_uri    EstimoteApi::Cloud.url
    basic_auth  APP_ID, APP_TOKEN
    headers     'Accept' => 'application/json'


    def self.all
      get('/beacons')
    end
  end
end