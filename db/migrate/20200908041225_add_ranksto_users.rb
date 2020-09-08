class AddRankstoUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :rank_id, :integer, null: false, default: 1
  end
end
