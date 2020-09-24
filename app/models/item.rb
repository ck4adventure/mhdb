# == Schema Information
#
# Table name: items
#
#  id            :bigint           not null, primary key
#  attr_bonus    :integer
#  cheese_effect :integer
#  itype         :integer          default("special"), not null
#  le            :boolean          default(FALSE), not null
#  luck          :integer
#  name          :string           not null
#  p_bonus       :integer
#  power         :integer
#  power_type    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_items_on_le          (le)
#  index_items_on_name        (name) UNIQUE
#  index_items_on_power_type  (power_type)
#
class Item < ApplicationRecord
  enum itype: { bait: 1, base: 2, charm: 3, collectible: 4, convertible: 5, crafting: 6, map_piece: 7, special: 8, weapon: 9, skin: 10 }
  enum power_type: { arcane: 1, draconic: 2, forgotten: 3, hydro: 4, law: 5, parental: 6, physical: 7, rift: 8, shadow: 9, tactical: 10, }
  enum cheese_effect: { uber_stale: -6, ultimately_stale: -5, insanely_stale: -4, extremely_stale: -3, very_stale: -2, stale: -1, no_effect: 0, fresh: 1, very_fresh: 2, extremely_fresh: 3, insanely_fresh: 4, ultimately_fresh: 5, uber_fresh: 6, }
  
  # Standard Items
  validates :name, presence: true, uniqueness: true
  validates :itype, presence: true
  validates :power_type, :power, :p_bonus, :attr_bonus, :luck, :cheese_effect, absence: true, unless: :trap_item?
  validates :power_type, absence: true, unless: :weapon_item?

  # Traps Items
  validates :power, :p_bonus, :attr_bonus, :luck, :cheese_effect, presence: true, if: :trap_item?
  validates :power_type, presence: true, if: :weapon_item?

  def trap_item?
    traps_items = ["weapon", "base", "charm"]
    traps_items.include?(self.itype)
  end

  def weapon_item?
    self.itype == "weapon"
  end
end
