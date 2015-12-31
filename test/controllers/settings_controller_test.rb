require 'test_helper'

class SettingsControllerTest < ActionController::TestCase
  test "should redirect if not authorized" do
    get :edit
    assert_redirected_to new_session_path
  end
end
