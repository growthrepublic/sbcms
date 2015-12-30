module ImgurApi
  class Uploader
    def initialize(opts = {})
      @client_id      = opts[:client_id]
      @client_secret  = opts[:client_secret]
      @access_token   = opts[:access_token]
      @refresh_token  = opts[:refresh_token]
      create_session

      self
    end

    def create_session
      @session ||= Imgurapi::Session.new(
          client_id:      @client_id,
          client_secret:  @client_secret,
          access_token:   @access_token,
          refresh_token:  @refresh_token
      )
    end

    def upload(file)
      image = @session.image.image_upload(file) rescue nil
      image.try(:link)
    end
  end
end
