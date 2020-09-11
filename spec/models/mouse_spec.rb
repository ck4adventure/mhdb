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
    describe 'it has a required unique name, amt of gold and amt of points' do
      let(:mouse) { build(:mouse) }
      it 'is valid when given valid values' do
        expect(mouse.valid?).to be true
      end
    end
    
    describe 'model shouldas' do
      subject { build(:mouse) }
      it { should validate_presence_of(:name) }
      it { should validate_uniqueness_of(:name) }
      it { should validate_numericality_of(:gold).is_greater_than_or_equal_to(10) }
      it { should validate_numericality_of(:points).is_greater_than_or_equal_to(0) }
    end

    describe 'association shouldas' do
      subject { build(:mouse) }
      it { should have_many(:mouse_locations) }
      it { should have_many(:locations).through(:mouse_locations) }
    end
  end
end
