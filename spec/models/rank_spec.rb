# == Schema Information
#
# Table name: ranks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_ranks_on_title  (title) UNIQUE
#
require 'rails_helper'

RSpec.describe Rank, type: :model do
  describe 'model properties' do
    let(:rank) { build(:rank) }
    it 'is valid with a valid, unique title' do
      expect(rank.valid?).to be true
    end
  end

  describe 'model shouldas' do
    subject { build(:rank) }
    it { should validate_presence_of(:title) }
  end

  describe 'model associations' do
    subject { build(:rank) }
    it { should have_many(:users) }
    it { should have_many(:locations) }
  end
end
