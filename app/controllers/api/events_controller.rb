module Api
  class EventsController < Api::ApplicationController
    def index
      events = Event.active.joins(:beacon).where(beacons: { unique_identifier: params[:unique_identifier] })

      render json: serialized(events, include: EventSerializer.includes)
    end

    def show
      event = Event.active.joins(:beacon).where(beacons: { unique_identifier: params[:unique_identifier] }, kind: params[:kind]).first!

      render json: serialized(event, include: EventSerializer.includes)
    end
  end
end