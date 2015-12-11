class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :sync_beacons

  def sync_beacons
    Rails.cache.fetch 'beacons_synced', expires_in: 5.minutes do BeaconsSynchronizer.new.sync end
  end
end
