module Api
  class BeaconsController < Api::ApplicationController
    def show
      render json: Beacon.find_by!(uuid: params[:uuid]).to_api
    end
  end
end