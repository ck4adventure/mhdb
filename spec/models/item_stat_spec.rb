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
require 'rails_helper'

RSpec.describe ItemStat, type: :model do
  describe 'properties and validations' do
    describe 'shouldas' do
      subject { build(:item_stat) }
      it { should validate_numericality_of(:power).only_integer.is_greater_than_or_equal_to(0) }
      it { should validate_numericality_of(:p_bonus).only_integer.is_greater_than_or_equal_to(0) }
      it { should validate_numericality_of(:attr_bonus).only_integer.is_greater_than_or_equal_to(0) }
      it { should validate_numericality_of(:luck).only_integer.is_greater_than_or_equal_to(0) }
      it { should validate_presence_of(:cheese_effect) }
    end

    describe 'power_type only goes for weapons items' do
      pending
    end

    it { should define_enum_for(:cheese_effect) }
    it { should define_enum_for(:power_type) }
  end
end
