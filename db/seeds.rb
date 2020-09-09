# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


titles = [
  "Novice",
  "Recruit",
  "Apprentice",
  "Initiate",
  "Journeyman",
  "Master",
  "Grandmaster",
  "Legendary",
  "Hero",
  "Knight",
  "Lord",
  "Baron",
  "Count",
  "Duke",
  "Grand Duke",
  "Archduke",
  "Viceroy",
  "Elder",
  "Sage",
  "Fabled",
]

titles.each do |titl|
  Rank.find_or_create_by!(title: titl)
end

larry = User.find_or_create_by!(name: "Larry", email: "larry@test.com", rank_id: Rank.first)
