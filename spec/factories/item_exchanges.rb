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
FactoryBot.define do
  factory :item_exchange do
    
  end
end
