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

class Beacon < ActiveRecord::Base
  has_many :events, dependent: :destroy
  accepts_nested_attributes_for :events

  validates :uuid, :major, :minor, presence: true
  validates :unique_identifier, uniqueness: { message: 'combination of UUID, major and minor must be unique.' }

  after_initialize -> { EventsManager.initialize_beacon_events(self) }
  before_validation :set_unique_identifier

  def set_unique_identifier
    self.unique_identifier = [uuid, major, minor].join('-')
  end
end
