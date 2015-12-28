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

class EventText < Event
end
