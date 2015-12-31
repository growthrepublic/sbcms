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

class BeaconsControllerTest < ActionController::TestCase
  setup do
    @beacon = beacons(:estimote)
    @params = { beacon: serialize(@beacon).merge({ events_attributes: serialize(@beacon.events) }) }

    sign_in
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create beacon" do
    assert_difference('Beacon.count') do
      post :create, params: @params
    end

    assert_redirected_to beacon_path(Beacon.last)
  end

  test "should show beacon" do
    get :show, params: { id: @beacon }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @beacon }
    assert_response :success
  end

  test "should update beacon" do
    patch :update, { id: @beacon }.merge(@params)
    assert_redirected_to beacon_path(@beacon)
  end
end
