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

gnawnia_locations = [
  {
    name: "Meadow",
    rank_id: 1,
  },
  {
    name: "Town of Gnawnia",
    rank_id: 2,
  },
  {
    name: "Windmill",
    rank_id: 3,
  },
  {
    name: "Harbour",
    rank_id: 4,
  },
  {
    name: "Mountain",
    rank_id: 5,
  },
]

gnawnia_locations.each do |loc|
  Location.find_or_create_by!(loc)
end

meadow_mice = [
  {
    name: "White",
    points: 70,
    gold: 100,
  },
  {
    name: "Grey",
    points: 90,
    gold: 125,
  },
  {
    name: "Brown",
    points: 115,
    gold: 150,
  },
  {
    name: "Lightning Rod",
    points: 175,
    gold: 100,
  },
]

meadow_mice.each do |mm|
  m = Mouse.find_or_create_by!(mm)
  l = MouseLocation.new(location_id: 1, mouse_id: m.id)
  l.save! if l.valid?
end

larry = User.find_or_create_by!(name: "Larry", email: "larry@test.com", rank_id: Rank.first)
