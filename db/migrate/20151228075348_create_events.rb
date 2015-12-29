class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string      :type,      null: false, default: 'EventText'
      t.integer     :kind,      null: false, default: 0
      t.boolean     :active,    null: false, default: false
      t.integer     :beacon_id, index: true
      t.text        :payload

      t.timestamps
    end
  end
end
