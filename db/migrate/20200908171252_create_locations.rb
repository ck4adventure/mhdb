class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.integer :rank_id, null: false
      
      t.timestamps
    end

    add_index :locations, :name, unique: true
    add_index :locations, :rank_id
  end
end
