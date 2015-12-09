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

module BeaconsHelper
  def beacon_avatar(beacon)
    asset_filename = "beacons/#{beacon.model}.png"

    if Rails.application.assets.find_asset(asset_filename).present?
      asset_url asset_filename
    else
      asset_url 'beacons/default.png'
    end
  end

  def beacon_payload_type(beacon)
    case beacon
      when BeaconText
        "Text"
      when BeaconUrl
        "URL"
      when BeaconImage
        "Image"
      else
        "Unknown"
    end
  end

  def beacon_model_options
    %w(default estimote-beacon).map do |model|
      [ t("beacons.models.#{model}"), model ]
    end
  end

  def beacon_nav_tab(beacon, label, klass, &block)
    id = "beacon_type_#{klass.name.underscore}"

    content_for :beacon_type_tabs do
      render partial: 'type_tab', locals: {
          active: beacon.is_a?(klass),
          type:   klass.name,
          label:  label,
          href:   "##{id}"
      }
    end

    content_for :beacon_type_tab_contents do
      render layout: 'type_tab_content', locals: {
          id:     id,
          active: beacon.is_a?(klass)
      }, &block
    end
  end
end