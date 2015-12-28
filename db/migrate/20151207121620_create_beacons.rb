class CreateBeacons < ActiveRecord::Migration
  def change
    create_table :beacons do |t|
      t.string  :name,  null: false, default: ''
      t.string  :model, null: false, default: ''
      t.string  :uuid,  null: false, default: ''
      t.integer :major, null: false, default: 1
      t.integer :minor, null: false, default: 1

      t.timestamps
    end
  end
end
