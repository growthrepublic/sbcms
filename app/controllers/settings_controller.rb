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

class SettingsController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]

  def new
  end

  def create
    Settings.update_with_password(settings_params)

    redirect_to root_path
  end

  def edit
  end

  def update
    Settings.update_with_password(settings_params)

    redirect_to root_path
  end

  private
    def settings_params
      params.permit(
          :password,
          :imgur_integration,
          :imgur_client_id,
          :estimote_integration,
          :estimote_app_id,
          :estimote_app_token,
          :kontakt_integration,
          :kontakt_api_key
      )
    end
end
