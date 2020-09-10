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

      it 'is not valid if no location id given' do
        mouseloc.location_id = nil
        expect(mouseloc.valid?).to be false
      end

      it 'is not valid if no mouse id given' do
        mouseloc.mouse_id = nil
        expect(mouseloc.valid?).to be false
      end
    end


    describe 'mice and locations can each have multiple entries' do
      let(:mouseloc) { build(:mouse_location) }
      it 'allows a mouse to have multiple entries' do
        ml2 = build(:mouse_location, mouse_id: mouseloc.mouse_id)
        expect(ml2.valid?).to be true
      end
      it 'allows a location to have multiple entries' do
        ml3 = build(:mouse_location, location_id: mouseloc.location_id)
        expect(ml3.valid?).to be true
      end
      it 'is not valid if a duplicate mouse id is given for a location' do
        ml4 = build(:mouse_location, mouseloc.attributes)
        expect(ml4.valid?).to be true
      end
    end
  end

  describe 'associations' do
    it 'belongs to a mouse'
    it 'belongs to a location'
  end
end
