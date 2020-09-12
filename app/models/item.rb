# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  le          :boolean          default(FALSE), not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer          not null
#
# Indexes
#
#  index_items_on_category_id  (category_id)
#  index_items_on_le           (le)
#  index_items_on_name         (name) UNIQUE
#
class Item < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :category_id, presence: true

  after_initialize :set_default_category

  belongs_to :category
  
  has_one :item_stat, dependent: :destroy
  accepts_nested_attributes_for :item_stat, reject_if: lambda {|attributes| attributes['luck'].blank?}

  def set_default_category
    self.category_id ||= 8
  end
  def trap_item?
    traps_items = ["weapon", "base", "charm"]
    traps_items.include?(self.category.name)
  end

  def weapon?
    self.category.name == "weapon"
  end
  

end
