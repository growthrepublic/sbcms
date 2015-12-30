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

class EventImage < Event
end
