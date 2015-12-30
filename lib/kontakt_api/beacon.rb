module KontaktApi
  class Beacon
    include HTTParty

    base_uri    KontaktApi::Cloud.url
    headers     'Accept' => 'application/vnd.com.kontakt+json;version=6'


    def self.all(api_key)
      options   = { headers: { 'Api-Key' => api_key } }
      response  = get('/device', options)

      JSON.parse(response)['devices'] rescue nil
    end
  end
end