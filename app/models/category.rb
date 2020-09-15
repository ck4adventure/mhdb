# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_name  (name) UNIQUE
#
class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :items

  def is_a_trap_category?
    traps = ["base", "weapon", "charm"]
    traps.include?(self.name)
  end
end
