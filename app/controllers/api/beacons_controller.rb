module Api
  class BeaconsController < Api::ApplicationController
    def index
      beacons = Beacon.all

      render json: serialized(beacons)
    end

    def show
      beacon = Beacon.find_by!(unique_identifier: params[:unique_identifier])

      render json: serialized(beacon)
    end
  end
end