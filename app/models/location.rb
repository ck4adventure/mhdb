# == Schema Information
#
# Table name: locations
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  rank_id    :integer          not null
#  region_id  :integer          not null
#
# Indexes
#
#  index_locations_on_name       (name) UNIQUE
#  index_locations_on_rank_id    (rank_id)
#  index_locations_on_region_id  (region_id)
#
class Location < ApplicationRecord
  has_one_attached :image
  validates :name, :rank_id, :region_id, presence: true
  validates :name, uniqueness: true

  # direct assocs
  belongs_to :rank
  belongs_to :region
  has_many :mouse_locations

  # throughs
  has_many :mice, through: :mouse_locations

  
end
