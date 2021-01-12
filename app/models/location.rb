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
class Location < ApplicationRecord
  has_one_attached :image
  validates :name, :rank_id, :region_id, presence: true
  # remember that booleans can't use traditional presence validation 
  # this is because a false will eval to empty in activerecordland
  validates :trapsmith, :cheese_shoppe, :general_store, :charm_shoppe, :cartographer, :kings_cart, inclusion: { in: [true, false]}
  validates :name, uniqueness: true

  # direct assocs
  belongs_to :rank
  belongs_to :region
  has_many :mouse_locations

  # throughs
  has_many :mice, through: :mouse_locations

  
end
