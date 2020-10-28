# == Schema Information
#
# Table name: locations
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  rank_id    :integer          not null
#  region_id  :integer          not null
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
    after(:create) do |loc|
      loc.image.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'windmill.jpg')), filename: 'viceroy.jpg', content_type: 'image/jpg')
    end
  end

end
