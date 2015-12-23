# == Schema Information
#
# Table name: beacons
#
#  id         :integer          not null, primary key
#  name       :string           default(""), not null
#  type       :string           default("BeaconText"), not null
#  model      :string           default(""), not null
#  uuid       :string           default(""), not null
#  major      :integer          default(1), not null
#  minor      :integer          default(1), not null
#  payload    :text
#  created_at :datetime
#  updated_at :datetime
#

class BeaconsController < ApplicationController
  before_action :set_beacon, only: [:show, :edit, :update, :destroy]
  helper BeaconsHelper

  def index
    @beacons = Beacon.page(params[:page])
  end

  def show
  end

  def new
    @beacon = Beacon.new
  end

  def edit
  end

  def create
    @beacon = Beacon.new(beacon_params)
    upload_image(@beacon, beacon_params[:payload]) if beacon_params[:type] == 'BeaconImage'

    if @beacon.save
      redirect_to beacon_path(@beacon), notice: 'Beacon was successfully created.'
    else
      render :new
    end
  end

  def update
    params[:beacon][:payload] = upload_image(@beacon, beacon_params[:payload]) if beacon_params[:type] == 'BeaconImage'

    if @beacon.update(beacon_params)
      redirect_to beacon_path(@beacon), notice: 'Beacon was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @beacon.destroy
    redirect_to beacons_url, notice: 'Beacon was successfully destroyed.'
  end

  private
    def set_beacon
      @beacon = Beacon.find(params[:id])
    end

    def beacon_params
    end

    def upload_image(beacon, file)
      if imgur_session && file
        image = imgur_session.image.image_upload(file)
        beacon.payload = image.link
      end
    end
end
