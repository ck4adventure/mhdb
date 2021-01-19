class AddMhCode < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :mh_code, :string
    add_column :mice, :mh_code, :string
  end
end
