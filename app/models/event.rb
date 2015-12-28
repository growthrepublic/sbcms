# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  type       :string           default("EventText"), not null
#  kind       :integer          default("enter"), not null
#  state      :integer          default("inactive"), not null
#  payload    :text
#  beacon_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Event < ActiveRecord::Base
  belongs_to :beacon, optional: true

  enum kind: {
      enter:      0,
      exit:       1,
      far:        2,
      near:       3,
      immediate:  4
  }

  enum state: {
      inactive:   0,
      active:     1
  }

  validates :type, inclusion: { in: %w(EventImage EventText EventUrl) }

  def event_type
    self.class.name.sub(/^Event/, '')
  end

  def to_api
    if active?
      {
        beacon: beacon.to_api,
        payload: payload,
        type: event_type
      }
    else
      {}
    end
  end
end
