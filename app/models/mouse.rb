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
class Mouse < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :gold, numericality: { only_integer: true, greater_than_or_equal_to: 10 }
  validates :points, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :mouse_locations

  has_many :locations, through: :mouse_locations


end
