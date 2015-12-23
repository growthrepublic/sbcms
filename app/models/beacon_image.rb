# == Schema Information
#
# Table name: beacons
#
#  id         :integer          not null, primary key
#  name       :string           default(""), not null
#  type       :string           default("BeaconText"), not null
#  model      :string           default(""), not null
#  uuid       :string           default(""), not null
#  major      :integer          default(1), not null
#  minor      :integer          default(1), not null
#  payload    :text
#  created_at :datetime
#  updated_at :datetime
#

class BeaconImage < Beacon
end
