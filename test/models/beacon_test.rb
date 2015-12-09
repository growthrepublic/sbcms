# == Schema Information
#
# Table name: beacons
#
#  id         :integer          not null, primary key
#  name       :string
#  type       :string
#  model      :string
#  uuid       :string
#  payload    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class BeaconTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
