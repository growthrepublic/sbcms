# == Schema Information
#
# Table name: beacons
#
#  id         :integer          not null, primary key
#  name       :string           default(""), not null
#  model      :string           default(""), not null
#  uuid       :string           default(""), not null
#  major      :integer          default(1), not null
#  minor      :integer          default(1), not null
#  created_at :datetime
#  updated_at :datetime
#

class Beacon < ActiveRecord::Base
  has_many :events, dependent: :destroy
  accepts_nested_attributes_for :events

  validates :uuid, :major, :minor, presence: true

  after_initialize -> { EventsManager.initialize_beacon_events(self) }

end
