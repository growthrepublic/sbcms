class BeaconsSynchronizer

  def self.sync
    %i(estimote kontakt).each do |service|
      self.send("sync_#{service}") if Settings.service_enabled?(service)
    end

    true
  end

  def self.sync_estimote
    beacons = EstimoteApi::Cloud.new(
      app_id:     Settings.estimote_app_id,
      app_token:  Settings.estimote_app_token
    ).beacons

    if beacons.is_a? Array
      beacons.each do |beacon_data|
        Beacon.find_or_initialize_by(model: 'estimote-beacon', unique_sync_id: beacon_data['mac']).tap do |b|
          b.name  = "#{ b.model }-#{ beacon_data['uuid'].split('-').last }" unless b.name.present?
          b.uuid  = beacon_data['uuid']
          b.major = beacon_data['major']
          b.minor = beacon_data['minor']
        end.save
      end
    end
  end

  def self.sync_kontakt
    beacons = KontaktApi::Cloud.new(
      api_key: Settings.kontakt_api_key
    ).beacons

    if beacons.is_a? Array
      beacons.each do |beacon_data|
        Beacon.find_or_initialize_by(model: 'kontakt-beacon', unique_sync_id: beacon_data['uniqueId']).tap do |b|
          b.name  = "#{ b.model }-#{ beacon_data['uuid'].split('-').last }" unless b.name.present?
          b.uuid  = beacon_data['id']
          b.major = beacon_data['major']
          b.minor = beacon_data['minor']
        end.save
      end
    end
  end
end