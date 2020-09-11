# == Schema Information
#
# Table name: mouse_locations
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  location_id :integer          not null
#  mouse_id    :integer          not null
#
# Indexes
#
#  index_mouse_locations_on_location_id               (location_id)
#  index_mouse_locations_on_mouse_id                  (mouse_id)
#  index_mouse_locations_on_mouse_id_and_location_id  (mouse_id,location_id) UNIQUE
#
require 'rails_helper'

RSpec.describe MouseLocation, type: :model do
  describe 'model properties and validations' do
    describe 'there is a mouse id and a location id required' do
      let(:mouseloc) { build(:mouse_location) }
      it 'is valid when valid info is given' do
        expect(mouseloc.valid?).to be true
      end
    end

    describe 'model shouldas' do
      subject { create(:mouse_location) }
      it { should validate_presence_of(:location_id) }
      it { should validate_presence_of(:mouse_id) }
      it { should validate_uniqueness_of(:mouse_id)
            .scoped_to(:location_id)
            .with_message("Mouse already saved to this location") }
    end
  end

  describe 'association shouldas' do
    subject { build(:mouse_location) }
    it { should belong_to(:mouse) }
    it { should belong_to(:location) }
  end
end
