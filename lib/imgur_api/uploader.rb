module ImgurApi
  class Uploader
    BASE_URI = URI('https://api.imgur.com/3/image')

    def initialize(client_id)
      @client_id = client_id
    end

    # upload image file using body_stream
    def upload(file)
      http = Net::HTTP.new(BASE_URI.host, BASE_URI.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER

      request = Net::HTTP::Post.new(BASE_URI.path)
      request['Authorization'] = "Client-ID #{@client_id}"
      request['Content-Length'] = file.size
      request['Transfer-Encoding'] = 'chunked'
      request.body_stream = file

      response = http.request(request)
      parsed_body = JSON.parse(response.body)

      parsed_body['data']['link']
    end
  end
end
