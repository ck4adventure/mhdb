# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  le          :boolean          default(FALSE), not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer          not null
#
# Indexes
#
#  index_items_on_category_id  (category_id)
#  index_items_on_le           (le)
#  index_items_on_name         (name) UNIQUE
#
FactoryBot.define do
  factory :item do
    name { Faker::JapaneseMedia::SwordArtOnline.item }
    le { false }
    category

    trait :limited_edition do
      le { true }
    end
  end
end
