# == Schema Information
#
# Table name: ranks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_ranks_on_title  (title) UNIQUE
#
class Rank < ApplicationRecord
  has_one_attached :image
  validates :title, presence: true, uniqueness: true

  has_many :users
  has_many :locations
  
  def image_path
    './' + self.title.delete("'").split(" ").join('_').downcase
  end

  
end
