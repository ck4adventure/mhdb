# == Schema Information
#
# Table name: items
#
#  id         :bigint           not null, primary key
#  itype      :integer          default("special"), not null
#  le         :boolean          default(FALSE), not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_items_on_le    (le)
#  index_items_on_name  (name) UNIQUE
#
require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'properties and their validations' do
    describe 'it has a unique name, an int itype, and is possibly limited edition' do
      let(:item) { build(:item) }
      it 'is valid when given valid values' do
        expect(item.valid?).to be true
      end
      it 'is invalid when no name is given' do
        item.name = nil
        expect(item.valid?).to be false
      end
      it 'is invalid when no itype is given' do
        item.itype = nil
        expect(item.valid?).to be false
      end
      it 'has a default le of false' do
        i2 = Item.new()
        expect(item.le).to be false
      end
      it 'sets le to true if given true' do
        i3 = build(:item, :limited_edition)
        expect(i3.le).to be true
      end
      it 'keeps le as true on save' do
        i3 = create(:item, :limited_edition)
        expect(i3.le).to be true
      end

      it 'is invalid if a duplicate name is given' do
        item.save
        i2 = Item.new(item.attributes)
        expect(i2.valid?).to be false
      end
    end
  end
end
