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

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  let(:event)       { events(:enter) }

  def test_valid
    assert event.valid?
  end
end
