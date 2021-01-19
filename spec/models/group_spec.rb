# == Schema Information
#
# Table name: groups
#
#  id         :bigint           not null, primary key
#  mh_code    :string
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_groups_on_name  (name) UNIQUE
#
require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'model for Group' do

    describe 'db columns and properties' do
      it { should have_db_column(:name) }
      it { should have_db_index(:name) }
      it { should have_db_column(:mh_code) }
    end

    describe 'model shouldas' do
      subject { build(:group) }
      it { should validate_presence_of(:name) }
      it { should validate_uniqueness_of(:name) }
      it { should validate_uniqueness_of(:mh_code) }

    end

    describe 'association shouldas' do
      subject { build(:group) }
      it { should have_many(:mice) }
    end
  end
end
