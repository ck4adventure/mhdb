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
FactoryBot.define do
  factory :item_exchange_cost do
    
  end
end
