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

class BeaconsController < ApplicationController
  before_action :set_beacon, only: [:show, :edit, :update, :destroy]
  helper BeaconsHelper

  def index
    @beacons = Beacon.all
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

    if @beacon.save
      redirect_to beacon_path(@beacon), notice: 'Beacon was successfully created.'
    else
      render :new
    end
  end

  def update
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
      params.require(:beacon).permit(:name, :type, :model, :uuid, :payload)
    end
end