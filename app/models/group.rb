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
class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :mh_code, uniqueness: true

  has_many :mice
end
