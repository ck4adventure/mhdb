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
class ItemStat < ApplicationRecord
  enum power_type: { arcane: 1, draconic: 2, forgotten: 3, hydro: 4, law: 5, parental: 6, physical: 7, rift: 8, shadow: 9, tactical: 10, }
  enum cheese_effect: { uber_stale: -6, ultimately_stale: -5, insanely_stale: -4, extremely_stale: -3, very_stale: -2,
                        stale: -1, no_effect: 0, fresh: 1, very_fresh: 2, extremely_fresh: 3, insanely_fresh: 4, ultimately_fresh: 5, uber_fresh: 6, }
  validates :item_id, presence: true, uniqueness: true
  validates :attr_bonus, :luck, :p_bonus, :power, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cheese_effect, presence: true
  
  validates :power_type, presence: true, if: :weapon_item?
  validate :must_be_trap_item

  before_save :ensure_no_power_type
  before_create :ensure_no_power_type
  before_update :ensure_no_power_type

  belongs_to :item

  def weapon_item?
    self.item.weapon?
  end

  def non_weapon_item?
    !self.item.weapon?
  end

  def ensure_no_power_type
    self.power_type = nil unless weapon_item?   
  end

  def must_be_trap_item
    traps = ["base", "weapon", "charm"]
    unless traps.include?(self.item.itype)
      errors.add(:itype, "is not of type 'base', 'weapon', or 'charm'")
    end
  end
end
