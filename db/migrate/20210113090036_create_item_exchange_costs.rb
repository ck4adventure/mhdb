class CreateItemExchangeCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :item_exchange_costs do |t|
      t.integer :item_id, null: false
      t.integer :item_required_id, null: false
      t.integer :qty_required, default: 1, null: false

      t.timestamps
    end

    add_index :item_exchange_costs, :item_id
    add_index :item_exchange_costs, :item_required_id
  end
end
