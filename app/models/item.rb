# == Schema Information
#
# Table name: items
#
#  id         :bigint           not null, primary key
#  itype      :integer          default("special"), not null
#  le         :boolean          default(FALSE), not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_items_on_le    (le)
#  index_items_on_name  (name) UNIQUE
#
class Item < ApplicationRecord
  enum itype: { bait: 1, base: 2, charm: 3, collectible: 4, convertible: 5, crafting: 6, map_piece: 7, special: 8, weapon: 9, skin: 10 }
  validates :name, presence: true, uniqueness: true
  validates :itype, presence: true

  has_one :item_stat, dependent: :destroy

  def trap_item?
    traps_items = ["weapon", "base", "charm"]
    traps_items.include?(self.itype)
  end
  

end
