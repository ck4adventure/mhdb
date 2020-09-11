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
    end

    describe 'model shouldas' do
      subject { build(:region) }
      it { should validate_presence_of(:name) }
      it { should validate_uniqueness_of(:name) }
    end

    describe 'association shouldas' do
      subject { build(:region) }
      it { should have_many(:locations) }
    end
  end
end
