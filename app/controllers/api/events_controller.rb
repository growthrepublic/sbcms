module Api
  class EventsController < Api::ApplicationController
    def index
      events = Event.active.joins(:beacon).where(beacons: { uuid: params[:uuid] })

      render json: serialized(events, include: EventSerializer.includes)
    end

    def show
      event = Event.active.joins(:beacon).where(beacons: { uuid: params[:uuid] }, kind: params[:kind]).first!

      render json: serialized(event, include: EventSerializer.includes)
    end
  end
end