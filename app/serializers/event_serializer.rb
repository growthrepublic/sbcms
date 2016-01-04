# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  type       :string           default("EventText"), not null
#  kind       :integer          default("enter"), not null
#  active     :boolean          default(FALSE), not null
#  beacon_id  :integer
#  payload    :text
#  created_at :datetime
#  updated_at :datetime
#

class EventSerializer < ActiveModel::Serializer
  attributes  :type,
              :kind,
              :payload,
              :active

  belongs_to  :beacon

  def self.includes
    %w(beacon)
  end
end
