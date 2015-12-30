class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_application

  def imgur_uploader
    @imgur_uploader ||= ImgurApi::Uploader.new(
        client_id:      Settings.imgur_client_id,
        client_secret:  Settings.imgur_client_secret,
        access_token:   Settings.imgur_access_token,
        refresh_token:  Settings.imgur_refresh_token
    )
  end

  def configure_application
    redirect_to new_setting_path unless Settings.installed?
  end

  def authenticate!
    redirect_to new_session_path unless settings
  end

  def settings
    @settings ||= Settings.authenticate(password)
  end

  def password
    @password ||= session[:password]
  end
end
