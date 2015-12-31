class BeaconSerializer < ActiveModel::Serializer
  attributes  :name,
              :model,
              :major,
              :minor,
              :uuid,
              :uniqueSyncId
end