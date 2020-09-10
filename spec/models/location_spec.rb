# == Schema Information
#
# Table name: locations
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  rank_id    :integer          not null
#  region_id  :integer          not null
#
# Indexes
#
#  index_locations_on_name       (name) UNIQUE
#  index_locations_on_rank_id    (rank_id)
#  index_locations_on_region_id  (region_id)
#
require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'model properties' do
    describe 'it has a required name, rank_id, region_id' do
      let(:loc) { build(:location) }
      it 'is valid when given valid information' do
        expect(loc.valid?).to be true
      end

      it 'is not valid when no name is given' do
        loc.name = ""
        expect(loc.valid?).to be false
      end
      it 'is not valid when no rank_id is given' do
        loc.rank_id = nil
        expect(loc.valid?).to be false
      end
      it 'is not valid when no region_id is given' do
        loc.region_id = nil
        expect(loc.valid?).to be false
      end
      it 'is not valid when duplicate name is given' do
        loc.save
        l2 = Location.new(loc.attributes)
        expect(l2.valid?).to be false
      end
    end
  end 

  describe 'model associations' do
    let(:loc) { build(:location) }
    it 'belongs to a rank' do
      expect(loc.rank).to be
      expect(loc.rank.title).to eq(Rank.find(loc.rank.id).title)
    end
  end
end
