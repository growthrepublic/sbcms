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
        Beacon.find_or_initialize_by(uuid: beacon_data['uuid']).tap do |b|
          b.model           = 'estimote-beacon'
          b.name            = "#{ b.model }-#{ beacon_data['uuid'].split('-').last }" unless b.name.present?
          b.major, b.minor  = beacon_data['major'], beacon_data['minor']
        end.save
      end
    end
  end

  def self.sync_kontakt
    beacons = KontaktApi::Beacon.all(Settings.kontakt_api_key)

    if beacons.is_a? Array
      beacons.each do |beacon_data|
        Beacon.find_or_initialize_by(uuid: beacon_data['id']).tap do |b|
          b.model           = 'kontakt-beacon'
          b.name            = "#{ model }-#{ beacon_data['id'].split('-').last }" unless b.name.present?
          b.major, b.minor  = beacon_data['major'], beacon_data['minor']
        end.save
      end
    end
  end
end