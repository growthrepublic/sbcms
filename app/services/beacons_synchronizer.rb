class BeaconsSynchronizer
  def initialize
    @providers = Rails.application.secrets.beacon_providers.keys || []
  end

  def sync
    @providers.each do |provider|
      method = "sync_#{ provider }"
      send(method) if respond_to?(method)
    end

    true
  end

  def sync_estimote
    beacons = EstimoteApi::Beacon.all

    if beacons.is_a? Array
      beacons.each do |beacon_data|
        Beacon.find_or_initialize_by(uuid: beacon_data['uuid']).tap do |b|
          b.name = "estimote-beacon-#{ beacon_data['uuid'].split('-').last }" unless b.present?
        end.save
      end
    end
  end

  def sync_kontakt
    beacons = KontaktApi::Beacon.all

    if beacons.is_a? Array
      beacons.each do |beacon_data|
        Beacon.find_or_initialize_by(uuid: beacon_data['id']).tap do |b|
          b.name = "kontakt-beacon-#{ beacon_data['id'].split('-').last }" unless b.present?
        end.save
      end
    end
  end
end