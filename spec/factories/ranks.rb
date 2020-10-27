# == Schema Information
#
# Table name: ranks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_ranks_on_title  (title) UNIQUE
#
FactoryBot.define do
  factory :rank do
    title { Faker::Games::Witcher.monster }
    after(:create) do |rank|
      rank.image.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'viceroy.gif')), filename: 'viceroy.gif', content_type: 'image/gif')
    end
  end
end
