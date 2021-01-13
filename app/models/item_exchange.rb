# == Schema Information
#
# Table name: item_exchanges
#
#  id          :bigint           not null, primary key
#  item_gained :integer          not null
#  method      :integer          default("purchase")
#  qty         :integer          default(1)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_item_exchanges_on_item_gained  (item_gained)
#  index_item_exchanges_on_method       (method)
#
class ItemExchange < ApplicationRecord
  enum method: {
    purchase: 1,
    craft: 2,
    brew: 3,
    smash: 4,
    refund: 5,
  }
  validates :item_gained, :qty, :method, presence: true
  validates :qty, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  belongs_to :item,
    foreign_key: :item_gained,
    class_name: :Item

end
