class AddUniqueIdentifierToBeacons < ActiveRecord::Migration
  def change
    add_column  :beacons, :unique_identifier, :string
    add_index   :beacons, :unique_identifier, unique: true

    Beacon.find_each do |beacon|
      beacon.set_unique_identifier
      beacon.save
    end

    change_column :beacons, :unique_identifier, :string, null: false, blank: false
  end
end
