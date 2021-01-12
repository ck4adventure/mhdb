# == Schema Information
#
# Table name: locations
#
#  id            :bigint           not null, primary key
#  cartographer  :boolean          default(FALSE), not null
#  charm_shoppe  :boolean          default(FALSE), not null
#  cheese_shoppe :boolean          default(FALSE), not null
#  general_store :boolean          default(FALSE), not null
#  kings_cart    :boolean          default(FALSE), not null
#  name          :string           not null
#  trapsmith     :boolean          default(FALSE), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  rank_id       :integer          not null
#  region_id     :integer          not null
#
# Indexes
#
#  index_locations_on_name       (name) UNIQUE
#  index_locations_on_rank_id    (rank_id)
#  index_locations_on_region_id  (region_id)
#
FactoryBot.define do
  FactoryBot.use_parent_strategy = false
  factory :location do
    name { Faker::Address.city }
    rank
    region

    trapsmith { false }
    cheese_shoppe { false }
    general_store { false }
    charm_shoppe { false }
    cartographer { false }

    trait :with_trapsmith do
      trapsmith { true }
    end

    trait :with_cheese_shoppe do
      trapsmith { true }
    end
    
    trait :with_general_store do
      trapsmith { true }
    end

    after(:create) do |loc|
      loc.image.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'windmill.jpg')), filename: 'viceroy.jpg', content_type: 'image/jpg')
    end
  end

end
