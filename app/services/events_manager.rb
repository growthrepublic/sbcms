class EventsManager
  def self.initialize_beacon_events(beacon)
    unless beacon.events.any?
      Event.kinds.keys.each do |kind|
        beacon.events.build(kind: kind, type: 'EventText')
      end
    end
  end
end
