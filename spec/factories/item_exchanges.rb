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
FactoryBot.define do
  factory :item_exchange do
    
  end
end
