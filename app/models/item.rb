# == Schema Information
#
# Table name: items
#
#  id            :bigint           not null, primary key
#  attr_bonus    :integer
#  cheese_effect :integer
#  le            :boolean          default(FALSE), not null
#  luck          :integer
#  name          :string           not null
#  p_bonus       :integer
#  power         :integer
#  power_type    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  category_id   :integer          not null
#
# Indexes
#
#  index_items_on_category_id  (category_id)
#  index_items_on_le           (le)
#  index_items_on_name         (name) UNIQUE
#  index_items_on_power_type   (power_type)
#
class Item < ApplicationRecord
  enum power_type: { arcane: 1, draconic: 2, forgotten: 3, hydro: 4, law: 5, parental: 6, physical: 7, rift: 8, shadow: 9, tactical: 10, }
  enum cheese_effect: { uber_stale: -6, ultimately_stale: -5, insanely_stale: -4, extremely_stale: -3, very_stale: -2,
                        stale: -1, no_effect: 0, fresh: 1, very_fresh: 2, extremely_fresh: 3, insanely_fresh: 4, ultimately_fresh: 5, uber_fresh: 6, }
  validates :name, presence: true, uniqueness: true
  validates :category_id, presence: true
  validates :power, :p_bonus, :attr_bonus, :luck, :cheese_effect, presence: true, if: :trap_item?
  validates :power_type, presence: true, if: :weapon_item?
  validates :power_type, :power, :p_bonus, :attr_bonus, :luck, :cheese_effect, absence: true, unless: :trap_item?
  validates :power_type, absence: true, unless: :weapon_item?

  after_initialize :set_default_category

  belongs_to :category
  
  has_one :item_stat, dependent: :destroy
  
  accepts_nested_attributes_for :item_stat, reject_if: lambda {|attributes| attributes['luck'].blank?}

  def set_default_category
    self.category_id ||= 8
  end

  def trap_item?
    traps_items = ["weapon", "base", "charm"]
    traps_items.include?(self.category.name)
  end

  def weapon_item?
    self.category.name == "weapon"
  end
end
