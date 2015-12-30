class SettingsController < ApplicationController
  skip_before_action  :configure_application, only: [:new, :create]
  before_action       :authenticate!, except: [:new, :create]

  def new
  end

  def create
    settings_params.each do |field, value|
      Settings.send("#{field}=", value)
    end

    redirect_to root_path
  end

  def edit
  end

  def update
    settings_params.each do |field, value|
      Settings.send("#{field}=", value)
    end

    redirect_to root_path
  end

  private
    def settings_params
      params.permit(
          :password,
          :imgur_client_id,
          :imgur_client_secret,
          :imgur_access_token,
          :imgur_refresh_token,
          :estimote_app_id,
          :estimote_app_token,
          :kontakt_api_key
      )
    end
end