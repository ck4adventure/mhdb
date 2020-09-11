# == Schema Information
#
# Table name: items
#
#  id         :bigint           not null, primary key
#  itype      :integer          default("special"), not null
#  le         :boolean          default(FALSE), not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_items_on_le    (le)
#  index_items_on_name  (name) UNIQUE
#
FactoryBot.define do
  factory :item do
    name { Faker::JapaneseMedia::SwordArtOnline.item }
    itype { Faker::Number.between(from: 1, to: 10) }
    le { false }

    trait :non_weapon do
      itype { "base" }
    end

    trait :has_weapon do
      itype { "weapon" }
    end

    trait :limited_edition do
      le { true }
    end
  end

  factory :weapon_item do
    name { Faker::JapaneseMedia::SwordArtOnline.item }
    itype { "weapon" }
    le { false }
  end


end
