# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  email         :string           not null
#  pw_hash       :string           not null
#  session_token :string           not null
#  username      :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  rank_id       :integer          default(1), not null
#
# Indexes
#
#  index_users_on_email          (email) UNIQUE
#  index_users_on_session_token  (session_token) UNIQUE
#  index_users_on_username       (username) UNIQUE
#
class User < ApplicationRecord
  validates :username, :email, :session_token, :pw_hash, presence: true
  validates :username, :email, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  
  after_initialize :ensure_session_token, :ensure_default_rank

  attr_reader :password
  
  belongs_to :rank
  has_many :locations,
    through: :rank

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def is_password?(pw)
    BCrypt::Password.new(self.pw_hash).is_password?(pw)
  end

  def password=(pw)
    @password = pw
    self.pw_hash = BCrypt::Password.create(pw)
  end

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
