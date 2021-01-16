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
#  group_id   :integer          not null
#
# Indexes
#
#  index_mice_on_group_id  (group_id)
#  index_mice_on_name      (name) UNIQUE
#
class Mouse < ApplicationRecord
  has_one_attached :image
  validates :name, :group_id, presence: true
  validates :name, uniqueness: true
  validates :gold, numericality: { only_integer: true, greater_than_or_equal_to: 10 }
  validates :points, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :group
  has_many :mouse_locations

  has_many :locations, through: :mouse_locations


end
