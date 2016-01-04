# == Schema Information
#
# Table name: settings
#
#  id         :integer          not null, primary key
#  var        :string           not null
#  value      :text
#  thing_id   :integer
#  thing_type :string(30)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class SettingsControllerTest < ActionController::TestCase
  test "should redirect if not authorized" do
    get :edit
    assert_redirected_to new_session_path
  end
end
