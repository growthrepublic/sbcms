# == Schema Information
#
# Table name: beacons
#
#  id         :integer          not null, primary key
#  name       :string
#  type       :string
#  model      :string
#  uuid       :string
#  payload    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Beacon < ActiveRecord::Base
  validates :type, inclusion: { in: %w(BeaconImage BeaconText BeaconUrl) }

  def beacon_type
    self.class.name.sub(/^Beacon/, '')
  end

  def to_api
    { type: beacon_type, payload: payload.to_s }
  end
end
