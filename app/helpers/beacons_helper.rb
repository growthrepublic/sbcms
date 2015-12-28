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

module BeaconsHelper
  def beacon_avatar(beacon)
    if %w(estimote-beacon kontakt-beacon).include? beacon.model
      asset_url "beacons/#{beacon.model}.png"
    else
      asset_url 'beacons/default.png'
    end
  end

  def beacon_payload_type(beacon)
    case beacon
      when EventText
        "Text"
      when EventUrl
        "URL"
      when EventImage
        "Image"
      else
        "Unknown"
    end
  end

  def beacon_model_options
    %w(default estimote-beacon kontakt-beacon).map do |model|
      [ t("beacons.models.#{model}"), model ]
    end
  end

  def event_nav_tab(event, label, klass, &block)
    id = "event_type_#{klass.name.underscore}"

    content_for :event_type_tabs do
      render partial: 'type_tab', locals: {
          active: event.is_a?(klass),
          type:   klass.name,
          label:  label,
          href:   "##{id}"
      }
    end

    content_for :event_type_tab_contents do
      render layout: 'type_tab_content', locals: {
          id:     id,
          active: event.is_a?(klass)
      }, &block
    end
  end
end
