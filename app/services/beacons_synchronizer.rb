class BeaconsSynchronizer

  def self.sync
    self.sync_estimote
    self.sync_kontakt

    true
  end

  def self.sync_estimote
    beacons = EstimoteApi::Beacon.all(Settings.estimote_app_id, Settings.estimote_app_token)

    if beacons.is_a? Array
      beacons.each do |beacon_data|
        Beacon.find_or_initialize_by(model: 'estimote-beacon', uniqueSyncId: beacon_data['mac']).tap do |b|
          b.name  = "#{ b.model }-#{ beacon_data['uuid'].split('-').last }" unless b.name.present?
          b.uuid  = beacon_data['uuid']
          b.major = beacon_data['major']
          b.minor = beacon_data['minor']
        end.save
      end
    end
  end

  def self.sync_kontakt
    beacons = KontaktApi::Beacon.all(Settings.kontakt_api_key)

    if beacons.is_a? Array
      beacons.each do |beacon_data|
        Beacon.find_or_initialize_by(model: 'kontakt-beacon', uniqueSyncId: beacon_data['id']).tap do |b|
          b.name  = "#{ b.model }-#{ beacon_data['uuid'].split('-').last }" unless b.name.present?
          b.uuid  = beacon_data['id']
          b.major = beacon_data['major']
          b.minor = beacon_data['minor']
        end.save
      end
    end
  end
end