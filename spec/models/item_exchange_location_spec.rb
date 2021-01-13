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
require 'rails_helper'

RSpec.describe ItemExchangeLocation, type: :model do
  describe 'model db properties' do
    it { should have_db_column_for(:item_exchange_id) }
    it { should have_db_column_for(:location_id) }
    it { should have_db_index(:location_id) }
    it { should have_db_index(:item_exchange_id) }
    # it { should have_db_index([:location, :item_exchange_id]) }
  end

  describe 'model validations' do
    it { should validate_presence_of(:item_exchange_id) }
    it { should validate_presence_of(:location_id) }
  end

  describe 'model associations' do
    it { should belong_to(:location) }
    it { should belong_to(:item_exchange) }
  end
end
