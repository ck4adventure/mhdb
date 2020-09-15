# == Schema Information
#
# Table name: items
#
#  id            :bigint           not null, primary key
#  attr_bonus    :integer
#  cheese_effect :integer
#  le            :boolean          default(FALSE), not null
#  luck          :integer
#  name          :string           not null
#  p_bonus       :integer
#  power         :integer
#  power_type    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  category_id   :integer          not null
#
# Indexes
#
#  index_items_on_category_id  (category_id)
#  index_items_on_le           (le)
#  index_items_on_name         (name) UNIQUE
#  index_items_on_power_type   (power_type)
#
require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'properties and their validations' do
    describe 'it must have a unique name and a category' do
      let(:item) { build(:item) }
      it 'is valid when given valid values' do
        expect(item.valid?).to be true
      end
    end

    describe 'shouldas' do
      subject { build(:item) }
      it { should validate_presence_of(:name) }
      it { should validate_uniqueness_of(:name) }
      it do
        pending
        should validate_presence_of(:category_id) 
      end
      it { should validate_presence_of(:le).allow_nil }
      it { should validate_presence_of(:power_type).allow_nil }
      it { should validate_presence_of(:power).allow_nil }
      it { should validate_presence_of(:p_bonus).allow_nil }
      it { should validate_presence_of(:attr_bonus).allow_nil }
      it { should validate_presence_of(:luck).allow_nil }
      it { should validate_presence_of(:cheese_effect).allow_nil }
    end

    describe 'assocation shouldas' do
      subject { build(:item) }
      it { should have_one(:item_stat) }
     # it { should belong_to(:category) }
    end

    describe 'it has an optional col for limited edition' do
      it 'has a default le of false' do
        i2 = Item.new()
        expect(i2.le).to be false
      end
      it 'sets le to true if given true' do
        i3 = build(:item, :limited_edition)
        expect(i3.le).to be true
      end
      it 'keeps le as true on save' do
        i3 = create(:item, :limited_edition)
        expect(i3.le).to be true
      end
    end

    describe 'when it is a category type weapon' do
      subject { build(:item, :weapon) }
      it 'returns a power_type if type is weapon' do
        i4 = build(:item, :weapon)
        expect(i4.power_type).to_not be nil
      end
      
      it 'keeps power_type on save' do
        i4 = create(:item, :weapon, :rift)
        expect(i4.power_type).to eq("rift")
      end

      it { should validate_presence_of(:power_type)}
      it { should validate_presence_of(:power) }
      it { should validate_presence_of(:p_bonus) }
      it { should validate_presence_of(:attr_bonus) }
      it { should validate_presence_of(:luck) }
      it { should validate_presence_of(:cheese_effect) }
    end

    describe 'when it is a category type: base' do
      subject { build(:item, :base) }
      it { should validate_absence_of(:power_type)}
      it { should validate_presence_of(:power) }
      it { should validate_presence_of(:p_bonus) }
      it { should validate_presence_of(:attr_bonus) }
      it { should validate_presence_of(:luck) }
      it { should validate_presence_of(:cheese_effect) }
    end
  end

  it { should define_enum_for(:cheese_effect) }
  it { should define_enum_for(:power_type) }
end
