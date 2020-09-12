# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Ranks are pretty Static
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

# Regions are seldom added
mh_regions = [
 "Gnawnia",
 "Valour",
 "Whisker Woods",
 "Burroughs",
 "Furoma",
 "Bristle Woods",
 "Tribal Isles",
 "Varmint Valley",
 "Queso Canyon",
 "Rodentia",
 "Sandtail Desert",
 "Hollow Heights",
 "Rift Plane",
 "Other",
]

mh_regions.each do |region|
  Region.find_or_create_by!(name: region)
end

# Too many locations, but here are some to get started
gnawnia_id = Region.find_by!(name: "Gnawnia").id
gnawnia_locations = [
  {
    name: "Meadow",
    rank_id: 1,
    region_id: gnawnia_id,
  },
  {
    name: "Town of Gnawnia",
    rank_id: 2,
    region_id: gnawnia_id,
  },
  {
    name: "Windmill",
    rank_id: 3,
    region_id: gnawnia_id,
  },
  {
    name: "Harbour",
    rank_id: 4,
    region_id: gnawnia_id,
  },
  {
    name: "Mountain",
    rank_id: 5,
    region_id: gnawnia_id,
  },
]

gnawnia_locations.each do |loc|
  Location.find_or_create_by!(loc)
end

valour_id = Region.find_by!(name: "Valour").id
valour_locations = [
  {
    name: "King's Arms",
    rank_id: 3,
    region_id: valour_id,
  },
  {
    name: "Tournament Hall",
    rank_id: 3,
    region_id: valour_id,
  },
  {
    name: "King's Gauntlet",
    rank_id: 9,
    region_id: valour_id,
  },
]

valour_locations.each do |loc|
  Location.find_or_create_by!(loc)
end

wwoods_id = Region.find_by!(name: "Whisker Woods").id
wwoods_locations = [
  {
    name: "Calm Clearing",
    rank_id: 5,
    region_id: wwoods_id,
  },
  {
    name: "Great Gnarled Tree",
    rank_id: 6,
    region_id: wwoods_id,
  },
  {
    name: "Lagoon",
    rank_id: 7,
    region_id: wwoods_id,
  },
]

wwoods_locations.each do |loc|
  Location.find_or_create_by!(loc)
end


# Just a few mice to get started
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


me = User.find_or_create_by!(name: "Dekka", email: "dekka", rank_id: Rank.last)

# Categories aka Item Types

categories = [
  "bait", "base", "charm", "collectible", "convertible", "crafting", "map_piece", "special", "weapon", "trap_skin",
]

categories.each do |catty|
  Category.find_or_create_by!(name: catty)
end