class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :sync_beacons

  def sync_beacons
    Rails.cache.fetch 'beacons_synced', expires_in: 5.minutes do BeaconsSynchronizer.new.sync end
  end

  def imgur_session
    @imgur_session ||= Imgurapi::Session.new(
        client_id:      Rails.application.secrets.imgur['client_id'],
        client_secret:  Rails.application.secrets.imgur['client_secret'],
        access_token:   Rails.application.secrets.imgur['access_token'],
        refresh_token:  Rails.application.secrets.imgur['refresh_token']
    )
  end
end
