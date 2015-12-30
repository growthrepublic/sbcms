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

class Event < ActiveRecord::Base
  belongs_to :beacon, optional: true

  EVENT_TYPES = %w(EventImage EventText EventUrl)

  enum kind: {
      enter:      0,
      exit:       1,
      far:        2,
      near:       3,
      immediate:  4
  }

  validates :type, inclusion: { in: EVENT_TYPES }

  scope :active, -> { where(active: true) }

  def event_type
    self.class.name.sub(/^Event/, '')
  end

  def to_api
    return {} unless active?
    {
      beacon:   beacon.to_api,
      payload:  payload,
      type:     event_type,
      kind:     kind
    }
  end

  def self.types
    EVENT_TYPES
  end
end
