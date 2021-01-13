class CreateItemExchangeLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :item_exchange_locations do |t|
      t.integer :item_exchange_id, null: false
      t.integer :location_id, null: false
      t.timestamps
    end

    add_index :item_exchange_locations, :location_id
    add_index :item_exchange_locations, :item_exchange_id

  end
end
