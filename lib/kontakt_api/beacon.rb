module KontaktApi
  class Beacon
    include HTTParty

    API_KEY =   Rails.application.secrets.beacon_providers['kontakt']['api_key']

    base_uri    KontaktApi::Cloud.url
    headers     'Accept' => 'application/vnd.com.kontakt+json;version=6',
                'Api-Key' => API_KEY


    def self.all
      JSON.parse(get('/device'))['devices']
    end
  end
end