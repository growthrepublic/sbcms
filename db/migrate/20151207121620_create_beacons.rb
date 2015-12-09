class CreateBeacons < ActiveRecord::Migration
  def change
    create_table :beacons do |t|
      t.string :name,  null: false, default: ''
      t.string :type,  null: false, default: 'BeaconText'
      t.string :model, null: false, default: ''
      t.string :uuid,  null: false, default: ''
      t.text :payload

      t.timestamps
    end
  end
end
