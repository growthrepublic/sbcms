class EventSerializer < ActiveModel::Serializer
  attributes  :type,
              :kind,
              :payload

  belongs_to  :beacon

  def self.includes
    %w(beacon)
  end
end