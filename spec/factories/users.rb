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
FactoryBot.define do
  factory :user do
    username { Faker::Games::Witcher.character }
    email { Faker::Internet.email }
    pw_hash { "teststring" }
    session_token { "teststring" }
    rank
  end
end
