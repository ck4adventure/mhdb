# == Schema Information
#
# Table name: locations
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  rank_id    :integer          not null
#
# Indexes
#
#  index_locations_on_name     (name) UNIQUE
#  index_locations_on_rank_id  (rank_id)
#
class Location < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  belongs_to :rank,
    foreign_key: :rank_id,
    class_name: :Rank
end
