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

unless User.find_by(email: "admin")
  me = User.create(name: "Huntress", email: "admin", rank_id: Rank.last)
end

unless User.find_by(email: "hello")
  you = User.create(name: "Guest", email: "hello", rank_id: Rank.first)
end

# Items

# Bait
meadow_cheeses = [
  {
    name: "Cheddar",
    itype: "bait",
  },
  {
    name: "Marble",
    itype: "bait",
  },
  {
    name: "Swiss",
    itype: "bait",
  },
]

meadow_cheeses.each do |ch|
  bait = Item.find_or_create_by(ch)
end

# Traps
meadow_traps = [
  {
    name: "500 Pound Spiked Crusher",
    itype: "weapon",
    power_type: "physical",
    power: 250,
    p_bonus: 10,
    attr_bonus: 0,
    luck: 1,
    cheese_effect: "no_effect"
  },
  {
    name: "Mouse Trebuchet",
    itype: "weapon",
    power_type: "physical",
    power: 600,
    p_bonus: 2,
    attr_bonus: 4,
    luck: 1,
    cheese_effect: "very_fresh"
  },
  {
    name: "Mouse Deathbot",
    itype: "weapon",
    power_type: "physical",
    power: 2400,
    p_bonus: 15,
    attr_bonus: 10,
    luck: 2,
    cheese_effect: "stale"
  },
  {
    name: "Wooden Base with Target",
    itype: "base",
    power: 75,
    p_bonus: 0,
    attr_bonus: 20,
    luck: 0,
    cheese_effect: "no_effect"
  },
  {
    name: "Stone Base",
    itype: "base",
    power: 150,
    p_bonus: 10,
    attr_bonus: 0,
    luck: 0,
    cheese_effect: "fresh"
  },
  {
    name: "Explosive Base",
    itype: "base",
    power: 300,
    p_bonus: 5,
    attr_bonus: 5,
    luck: 0,
    cheese_effect: "stale"
  },
]

meadow_traps.each do |item|
  item = Item.find_or_create_by(item)
end