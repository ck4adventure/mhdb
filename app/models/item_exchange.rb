# == Schema Information
#
# Table name: item_exchanges
#
#  id         :bigint           not null, primary key
#  method     :integer          default("purchase"), not null
#  qty        :integer          default(1), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :integer          not null
#
# Indexes
#
#  index_item_exchanges_on_item_id  (item_id)
#  index_item_exchanges_on_method   (method)
#
class ItemExchange < ApplicationRecord
  enum method: {
    purchase: 1,
    craft: 2,
    brew: 3,
    smash: 4,
    refund: 5,
  }
  validates :item_id, :qty, :method, presence: true
  validates :qty, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  belongs_to :item

end
