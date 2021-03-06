# == Schema Information
#
# Table name: locations
#
#  id            :bigint           not null, primary key
#  cartographer  :boolean          default(FALSE), not null
#  charm_shoppe  :boolean          default(FALSE), not null
#  cheese_shoppe :boolean          default(FALSE), not null
#  general_store :boolean          default(FALSE), not null
#  kings_cart    :boolean          default(FALSE), not null
#  name          :string           not null
#  trapsmith     :boolean          default(FALSE), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  rank_id       :integer          not null
#  region_id     :integer          not null
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
    describe 'the faker model is valid' do
      let(:loc) { build(:location) }
      it 'is valid when given valid information' do
        expect(loc.valid?).to be true
      end
    end

    describe 'db and model properties' do
      it { should have_db_column(:name) }
      it { should have_db_column(:rank_id) }
      it { should have_db_column(:region_id) }
      it { should have_db_column(:trapsmith) }
      it { should have_db_column(:cheese_shoppe) }
      it { should have_db_column(:general_store) }
      it { should have_db_column(:charm_shoppe) }
      it { should have_db_column(:cartographer) }
      it { should have_db_column(:kings_cart) }

      it { should have_db_index(:name) }
      it { should have_db_index(:rank_id) }
      it { should have_db_index(:region_id) }
    end

    describe 'model validations' do
      subject { build(:location) }
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:rank_id) }
      it { should validate_presence_of(:region_id) }
      it { should validate_uniqueness_of(:name) }

      # note, boolean inclusion checking not performed

    end

    describe 'model assocation shouldas' do
      subject { build(:location) }
      it { should belong_to(:region) }
      it { should belong_to(:rank) }
      it { should have_many(:mouse_locations) }
      it { should have_many(:mice).through(:mouse_locations) }
      it { should have_one_attached(:image) }
    end
  end 
end
