# == Schema Information
#
# Table name: locations
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  rank_id    :integer          not null
#
# Indexes
#
#  index_locations_on_name     (name) UNIQUE
#  index_locations_on_rank_id  (rank_id)
#
require 'rails_helper'

RSpec.describe Location, type: :model do
  before(:all) do
    @rank = Rank.create!(title: "Testy me once")
    @rank2 = Rank.create!(title: "Testy me twice")
  end
  describe 'model properties' do
    describe 'it has a required name and rank_id' do
      let(:loc) { Location.new(name: "Testing Grounds", rank_id: 1) }
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
      it 'is not valid when duplicate name is given' do
        loc.save!
        l2 = Location.new(name: loc.name, rank_id: 1)
        expect(l2.valid?).to be false
      end
    end
  end 

  describe 'model associations' do
    it 'belongs to a rank' do
      loc = Location.new(name: "Fairytown", rank_id: 2)
      expect(loc.rank).to be
      expect(loc.rank.title).to eq(Rank.find(2).title)
    end
  end
end