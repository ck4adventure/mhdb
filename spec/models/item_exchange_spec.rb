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
require 'rails_helper'

RSpec.describe ItemExchange, type: :model do
  describe 'model db properties' do
    it { should have_db_column(:item_gained) }
    it { should have_db_column(:qty) }
    it { should have_db_column(:method) }
    it { should have_db_index(:item_gained) }
    it { should have_db_index(:method) }
  end

  describe 'model validations' do
    it { should validate_presence_of(:item_gained) }
    it { should validate_presence_of(:qty) }
    it { should validate_numericality_of(:qty).only_integer.is_greater_than_or_equal_to(1) }
    it { should validate_presence_of(:method) }
    it { should define_enum_for(:method) }
  end

  describe 'model associations' do
    it { should belong_to(:item) }

  end
end
