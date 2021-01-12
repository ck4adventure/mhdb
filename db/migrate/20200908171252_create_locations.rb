class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.integer :rank_id, null: false
      t.integer :region_id, null: false
      t.boolean :trapsmith, null: false, default: false
      t.boolean :cheese_shoppe, null: false, default: false
      t.boolean :general_store, null: false, default: false
      t.boolean :charm_shoppe, null: false, default: false
      t.boolean :cartographer, null: false, default: false
      t.boolean :kings_cart, null: false, default: false
      t.timestamps
    end

    add_index :locations, :name, unique: true
    add_index :locations, :rank_id
    add_index :locations, :region_id
  end
end
