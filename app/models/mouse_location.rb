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
class MouseLocation < ApplicationRecord
  validates :location_id, :mouse_id, presence: true
  validates :mouse_id, uniqueness: { scope: :location_id, message: "Mouse already saved to this location" }
end
