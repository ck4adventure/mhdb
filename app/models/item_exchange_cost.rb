# == Schema Information
#
# Table name: item_exchange_costs
#
#  id               :bigint           not null, primary key
#  qty_required     :integer          default(1), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  item_id          :integer          not null
#  item_required_id :integer          not null
#
# Indexes
#
#  index_item_exchange_costs_on_item_id           (item_id)
#  index_item_exchange_costs_on_item_required_id  (item_required_id)
#
class ItemExchangeCost < ApplicationRecord
  validates :item_id, :item_required_id, presence: true
  validates :qty_required, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  belongs_to :item_gained,
    foreign_key: :item_id,
    class_name: :Item

  belongs_to :item_required,
    foreign_key: :item_required_id,
    class_name: :Item
end
