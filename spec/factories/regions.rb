# == Schema Information
#
# Table name: regions
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_regions_on_name  (name) UNIQUE
#
FactoryBot.define do
  factory :region do
    name { Faker::Games::Witcher.location }
  end
end
