class CreateRanks < ActiveRecord::Migration[6.0]
  def change
    create_table :ranks do |t|
      t.string :title, null: false
      t.timestamps
    end

    add_index :ranks, :title, unique: true
  end
end
