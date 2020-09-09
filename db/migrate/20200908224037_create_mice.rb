class CreateMice < ActiveRecord::Migration[6.0]
  def change
    create_table :mice do |t|
      t.string :name, null: false
      t.integer :points, null: false
      t.integer :gold, null: false
      t.timestamps
    end

    add_index :mice, :name, unique: true
  end
end
