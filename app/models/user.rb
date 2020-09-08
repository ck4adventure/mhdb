# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  email         :string           not null
#  name          :string           not null
#  session_token :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  rank_id       :integer          default(1), not null
#
# Indexes
#
#  index_users_on_email          (email) UNIQUE
#  index_users_on_session_token  (session_token) UNIQUE
#
class User < ApplicationRecord
  validates :name, :email, :session_token, presence: true
  validates :email, :session_token, uniqueness: true
  after_initialize :ensure_session_token, :ensure_default_rank
  
  belongs_to :rank
  has_many :locations,
    through: :rank

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token ||= SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def ensure_default_rank
    self.rank_id ||= 1
  end

end
