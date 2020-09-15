class MoveItemStats < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :power_type, :integer
    add_column :items, :power, :integer
    add_column :items, :p_bonus, :integer
    add_column :items, :attr_bonus, :integer
    add_column :items, :luck, :integer
    add_column :items, :cheese_effect, :integer
    add_index :items, :power_type
  end
end
