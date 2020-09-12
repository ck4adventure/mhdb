class AddCategoryToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :category_id, :integer, null: false
    remove_column :items, :itype
    add_index :items, :category_id
  end
end
