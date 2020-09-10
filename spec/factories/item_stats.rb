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
    
  end
end
