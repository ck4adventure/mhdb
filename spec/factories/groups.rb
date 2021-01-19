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
FactoryBot.define do
  factory :group do
    name { Faker::Color.color_name }
  end
end
