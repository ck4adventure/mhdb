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
    describe 'it has a bunch of stuff' do
      subject { build(:item_stat) }
      it { should validate_numericality_of(:power) }
      it { should validate_numericality_of(:p_bonus) }
      it { should validate_numericality_of(:attr_bonus) }
      it { should validate_numericality_of(:luck) }
      it { should validate_presence_of(:cheese_effect) }
    end

    it { should define_enum_for(:cheese_effect) }
    it { should define_enum_for(:power_type) }
  end
end
