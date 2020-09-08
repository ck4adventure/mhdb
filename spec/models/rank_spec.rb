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

    it 'does not allow a duplicate' do
      rank.save!
      new_rank = Rank.new(title: rank.title)
      expect(new_rank.valid?).to be false
    end
  end

  describe 'model associations' do
    it 'has many locations available to it'
  end
end
