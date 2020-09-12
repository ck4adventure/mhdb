# == Schema Information
#
# Table name: item_stats
#
#  id            :bigint           not null, primary key
#  attr_bonus    :integer          not null
#  cheese_effect :integer          not null
#  luck          :integer          not null
#  p_bonus       :integer          not null
#  power         :integer          not null
#  power_type    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  item_id       :integer          not null
#
# Indexes
#
#  index_item_stats_on_item_id     (item_id) UNIQUE
#  index_item_stats_on_power_type  (power_type)
#
FactoryBot.define do
  factory :item_stat do
    item
    power_type { Faker::Number.between(from: 1, to: 10)}
    power { Faker::Number.between(from: 100, to: 1000) }
    p_bonus { Faker::Number.between(from: 0, to: 20) }
    attr_bonus { Faker::Number.between(from: 0, to: 10) }
    luck { Faker::Number.between(from: 0, to: 35) }
    cheese_effect { Faker::Number.between(from: -6, to: 6) }
  end
end
