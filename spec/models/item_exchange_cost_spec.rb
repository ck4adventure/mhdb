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
require 'rails_helper'

RSpec.describe ItemExchangeCost, type: :model do
  describe 'model db properties' do
    it { should have_db_column_for(:item_id) }
    it { should have_db_column_for(:item_required_id) }
    it { should have_db_column_for(:qty_required) }
    it { should have_db_index(:item_id) }
    it { should have_db_index(:item_required_id) }
  end

  describe 'model validations' do
    it { should validate_presence_of(:item_id) }
    it { should validate_presence_of(:item_required_id) }
    it { should validate_numericality_of(:qty_required).only_integer.is_greater_than_or_equal_to(1) }

  end

  describe 'model associations' do
    it { should belong_to(:item_gained) }
    it { should belong_to(:item_required) }
  end
end
