class CreateMice < ActiveRecord::Migration[6.0]
  def change
    create_table :mice do |t|
      t.string :name, null: false
      t.integer :points, null: false
      t.integer :gold, null: false
      t.integer :group_id, null: false
      t.timestamps
    end

    add_index :mice, :name, unique: true
    add_index :mice, :group_id
  end
end
