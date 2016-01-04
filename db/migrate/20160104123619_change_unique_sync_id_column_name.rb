class ChangeUniqueSyncIdColumnName < ActiveRecord::Migration
  def change
    rename_column :beacons, :uniqueSyncId, :unique_sync_id
  end
end
