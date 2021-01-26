# == Schema Information
#
# Table name: mice
#
#  id         :bigint           not null, primary key
#  gold       :integer          not null
#  mh_code    :string
#  name       :string           not null
#  points     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer          not null
#
# Indexes
#
#  index_mice_on_group_id  (group_id)
#  index_mice_on_name      (name) UNIQUE
#
require 'rails_helper'

RSpec.describe Mouse, type: :model do
  describe 'mouse model properties' do
    describe 'db columns and properties' do
      it { should have_db_column(:name) }
      it { should have_db_index(:name) }
      it { should have_db_column(:group_id) }
      it { should have_db_index(:group_id) }
      it { should have_db_column(:mh_code) }
    end
    
    describe 'model shouldas' do
      subject { build(:mouse) }
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:group_id) }
      it { should validate_uniqueness_of(:name) }
      it { should validate_numericality_of(:gold).is_greater_than_or_equal_to(10).allow_nil }
      it { should validate_numericality_of(:points).is_greater_than_or_equal_to(0).allow_nil }
      it { should validate_uniqueness_of(:mh_code).allow_nil }
    end

    describe 'association shouldas' do
      subject { build(:mouse) }
      it { should belong_to(:group) }
      it { should have_many(:mouse_locations) }
      it { should have_many(:locations).through(:mouse_locations) }
    end
  end
end
