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
    process_images(@beacon) if @beacon.valid?

    if @beacon.save
      redirect_to beacon_path(@beacon), notice: 'Beacon was successfully created.'
    else
      render :new
    end
  end

  def update
    @beacon.update_attributes(beacon_params)
    process_images(@beacon) if @beacon.valid?

    if @beacon.save
      redirect_to beacon_path(@beacon), notice: 'Beacon was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @beacon.destroy
    redirect_to beacons_url, notice: 'Beacon was successfully destroyed.'
  end

  def fetch
    BeaconsSynchronizer.sync

    redirect_to beacons_path
  end

  private
    def set_beacon
      @beacon = Beacon.find(params[:id])
    end

    def beacon_params
      params.require(:beacon).permit(
          :name,
          :model,
          :uuid,
          :major,
          :minor,
          events_attributes: [:id, :type, :kind, :payload, :active]
      )
    end

    def process_images(beacon)
      params[:beacon][:events_attributes].each_with_index do |event, index|
        if event[:payload].present? && event[:type] == 'EventImage'
          beacon.events[index][:payload] = imgur_uploader.upload(event[:payload])
        end
      end
    end
end
