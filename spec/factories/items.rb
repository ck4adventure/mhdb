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
FactoryBot.define do
  factory :item do
    name { Faker::JapaneseMedia::SwordArtOnline.item }
    le { false }
    category

    trait :limited_edition do
      le { true }
    end

    trait :weapon do
      category factory: :category, name: "weapon"
      power_type { "arcane" }
      power { Faker::Number.between(from: 100, to: 1000) }
      p_bonus { Faker::Number.between(from: 0, to: 20) }
      attr_bonus { Faker::Number.between(from: 0, to: 10) }
      luck { Faker::Number.between(from: 0, to: 35) }
      cheese_effect { Faker::Number.between(from: -6, to: 6) }
    end

    trait :base do
      category factory: :category, name: "base"
      power { Faker::Number.between(from: 100, to: 1000) }
      p_bonus { Faker::Number.between(from: 0, to: 20) }
      attr_bonus { Faker::Number.between(from: 0, to: 10) }
      luck { Faker::Number.between(from: 0, to: 35) }
      cheese_effect { Faker::Number.between(from: -6, to: 6) }
    end

    trait :hyrdo do
      power_type { "hydro" }
    end

    trait :rift do
      power_type { "rift" }
    end
  end
end
