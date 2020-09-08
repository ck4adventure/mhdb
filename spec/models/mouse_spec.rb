# == Schema Information
#
# Table name: mice
#
#  id         :bigint           not null, primary key
#  gold       :integer          not null
#  name       :string           not null
#  points     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_mice_on_name  (name) UNIQUE
#
require 'rails_helper'

RSpec.describe Mouse, type: :model do
  describe 'model properties' do
    context 'it has a required unique name, amt of gold and amt of points' do
      let(:mouse) { Mouse.new(name: "Minnie", gold: 550, points: 1000) }
      it 'is valid when given valid values' do
        expect(mouse.valid?).to be true
      end

      it 'is not valid when no name is present' do
        mouse.name = nil
        expect(mouse.valid?).to be false
      end

      it 'is not valid when name is not unique' do 
        mouse.save!
        m2 = Mouse.new(name: mouse.name, gold: 500, points: 500)
        expect(m2.valid?).to be false
      end
      
      it 'is not valid when there is no amt of gold given' do
        mouse.gold = nil
        expect(mouse.valid?).to be false
      end

      it 'is not valid when the amount of gold is 0' do
        mouse.gold = 0
        expect(mouse.valid?).to be false
      end

      it 'is not valid when the amount of gold is negative' do
        mouse.gold = -2
        expect(mouse.valid?).to be false
      end

      it 'is not valid when there is no amt of points given' do
        mouse.points = nil
        expect(mouse.valid?).to be false
      end

      it 'is not valid when the amount of points is 0' do
        mouse.points = 0
        expect(mouse.valid?).to be false
      end

      it 'is not valid when the amount of points is negative' do
        mouse.points = -2
        expect(mouse.valid?).to be false
      end
    end

  end
end
