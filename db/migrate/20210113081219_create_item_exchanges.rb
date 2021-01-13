class CreateItemExchanges < ActiveRecord::Migration[6.0]
  def change
    create_table :item_exchanges do |t|
      t.integer :item_gained, null: false
      t.integer :qty, default: 1, null: false
      t.integer :method, default: 1, null: false
      t.timestamps
    end

    add_index :item_exchanges, :item_gained
    add_index :item_exchanges, :method
  end
end
