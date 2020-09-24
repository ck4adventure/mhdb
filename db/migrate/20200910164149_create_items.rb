class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :itype, null: false, default: 8
      t.boolean :le, null: false, default: false
      t.integer :power_type
      t.integer :power
      t.integer :p_bonus
      t.integer :attr_bonus
      t.integer :luck
      t.integer :cheese_effect
      
      t.timestamps
    end

    add_index :items, :name, unique: true
    add_index :items, :power_type
    add_index :items, :le
  end
end
