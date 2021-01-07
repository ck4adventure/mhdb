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
FactoryBot.define do
  factory :mouse do
    name { Faker::Movies::Hobbit.character }
    gold { Faker::Number.between(from: 10, to: 50000) }
    points { Faker::Number.between(from: 0, to: 10) }
    group
  end
end
