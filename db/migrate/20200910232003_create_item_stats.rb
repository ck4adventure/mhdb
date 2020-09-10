class CreateItemStats < ActiveRecord::Migration[6.0]
  def change
    create_table :item_stats do |t|
      t.integer :item_id, null: false
      t.integer :power_type
      t.integer :power, null: false
      t.integer :p_bonus, null: false
      t.integer :attr_bonus, null: false
      t.integer :luck, null: false
      t.integer :cheese_effect, null: false

      t.timestamps
    end

    add_index :item_stats, :item_id, unique: true
    add_index :item_stats, :power_type
  end
end
