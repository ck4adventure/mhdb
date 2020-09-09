class CreateMouseLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :mouse_locations do |t|
      t.integer :mouse_id, null: false
      t.integer :location_id, null: false
      t.timestamps
    end

    add_index :mouse_locations, :mouse_id
    add_index :mouse_locations, :location_id
    add_index :mouse_locations, [:mouse_id, :location_id], unique: true
  end
end
