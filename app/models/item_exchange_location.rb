# == Schema Information
#
# Table name: item_exchange_locations
#
#  id               :bigint           not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  item_exchange_id :integer          not null
#  location_id      :integer          not null
#
# Indexes
#
#  index_item_exchange_locations_on_item_exchange_id  (item_exchange_id)
#  index_item_exchange_locations_on_location_id       (location_id)
#
class ItemExchangeLocation < ApplicationRecord
  validates :item_exchange_id, :location_id, presence: true

  belongs_to :location
  belongs_to :item_exchange
end
