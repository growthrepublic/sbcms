module Api
  class EventsController < Api::ApplicationController
    def show
      event = Event.joins(:beacon).where(beacons: { uuid: params[:uuid] }, kind: params[:kind]).first
      render json: event.try(:to_api)
    end
  end
end