class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user

  def imgur_uploader
    @imgur_uploader ||= ImgurApi::Uploader.new(
        client_id:      Settings.imgur_client_id,
        client_secret:  Settings.imgur_client_secret,
        access_token:   Settings.imgur_access_token,
        refresh_token:  Settings.imgur_refresh_token
    )
  end

  def authenticate_user
    if Settings.configuration_finished
      unless Settings.authenticate(session[:password])
        session[:password] = nil
        redirect_to new_session_path
        false
      end
    else
      redirect_to new_setting_path
    end
  end
end
