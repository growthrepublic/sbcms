class AddUniqueSyncIdToBeacons < ActiveRecord::Migration
  def change
    add_column :beacons, :uniqueSyncId, :string, default: ''
  end
end
