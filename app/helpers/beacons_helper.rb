# == Schema Information
#
# Table name: beacons
#
#  id                :integer          not null, primary key
#  name              :string           default(""), not null
#  model             :string           default(""), not null
#  uuid              :string           default(""), not null
#  major             :integer          default(1), not null
#  minor             :integer          default(1), not null
#  created_at        :datetime
#  updated_at        :datetime
#  unique_sync_id    :string           default("")
#  unique_identifier :string           not null
#

module BeaconsHelper
  def beacon_avatar(beacon)
    if %w(estimote-beacon kontakt-beacon).include? beacon.model
      asset_url "beacons/#{beacon.model}.png"
    else
      asset_url 'beacons/default.png'
    end
  end

  def beacon_model_options
    %w(default estimote-beacon kontakt-beacon).map do |model|
      [ t("beacons.models.#{model}"), model ]
    end
  end
end
