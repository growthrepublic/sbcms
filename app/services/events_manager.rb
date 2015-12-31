class EventsManager
  def self.initialize_beacon_events(beacon)
    Event.kinds.keys.each do |kind|
      unless beacon.events.public_send(kind).any?
        beacon.events.build(kind: kind, type: 'EventText')
      end
    end
  end
end
