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

require 'test_helper'

class BeaconTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
