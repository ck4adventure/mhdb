# == Schema Information
#
# Table name: regions
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_regions_on_name  (name) UNIQUE
#
require 'rails_helper'

RSpec.describe Region, type: :model do
  describe 'model properties:' do
    describe 'has a unique name' do
      let(:region) { build(:region) }
      it 'is valid when given a valid name' do
        expect(region.valid?).to be true
      end
      it 'is invalid when given no name' do
        region.name = nil
        expect(region.valid?).to be false
      end
      it 'is invalid when given a duplicate name' do
        region.save
        r2 = Region.new(name: region.name)
        expect(region.valid?).to be false
      end
    end
  end
end
