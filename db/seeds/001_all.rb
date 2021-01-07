mh_groups = [
 "Indigenous Mice",
 "Dock Dwellers",
 "Mountain Mice",
 "Forest Guild",
 "Lab Experiments",
 "The Shadow Clan",
 "Digby Dirt Dwellers",
 "Followers of Furoma",
 "The Forgotten Mice",
 "Aquatic Order",
 "The Elub Tribe",
 "The Nerg Tribe",
 "The Derr Tribe",
 "The Dreaded Horde",
 "Draconic Brood",
 "Balack's Banished",
 "Gauntlet Gladiators",
 "Seasonal Soldiers",
 "Wizard's Pieces",
 "Zurreal's Breed",
 "Icewing's Invasion",
 "Wild Bunch",
 "Train Robbers",
 "Meteorite Miners",
 "The Marching Flame",
 "Muridae Market Mice",
 "Living Garden Mice",
 "Lost City Mice",
 "Sand Dunes Mice",
 "Queso Canyoneers",
 "Deep Sea Dwellers",
 "Fungal Fiends",
 "Citizens of Zokor",
 "Moussu Picchu Inhabitants",
 "Floating Islanders",
 "Rift Walkers",
 "Rift Stalkers",
 "The Polluted",
 "Event Mice",
]

mh_groups.each do |group|
  Group.find_or_create_by!(name: group)
end

indig_id = Group.find_by!(name: "Indigenous Mice").id
# Just a few mice to get started
indig_mice = [
  {
    name: "White Mouse",
    points: 70,
    gold: 100,
    group_id: indig_id,
  },
  {
    name: "Grey Mouse",
    points: 90,
    gold: 125,
    group_id: indig_id,
  },
  {
    name: "Brown Mouse",
    points: 115,
    gold: 150,
    group_id: indig_id,
  },
  {
    name: "Lightning Rod Mouse",
    points: 175,
    gold: 100,
    group_id: indig_id,
  },
]

indig_mice.each do |mm|
  m = Mouse.find_or_create_by!(mm)
end

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
  t = Rank.find_or_create_by!(title: titl)
  path = titl.delete("'").split(" ").join('_').downcase + '.gif'
  t.image.attach(
    io: File.open("./public/seeds_images/ranks/#{path}"),
    filename: path,
    content_type: 'application/gif',
  )
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
  l = Location.find_or_create_by!(loc)
  path = l.name.delete("'").split(" ").join('_').downcase + '.jpg'
  l.image.attach(
    io: File.open("./public/seeds_images/locations/#{path}"),
    filename: path,
    content_type: 'application/jpg',
  )
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
  l = Location.find_or_create_by!(loc)
  path = l.name.delete("'").split(" ").join('_').downcase + '.jpg'
  l.image.attach(
    io: File.open("./public/seeds_images/locations/#{path}"),
    filename: path,
    content_type: 'application/jpg',
  )
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
  l = Location.find_or_create_by!(loc)
  path = l.name.delete("'").split(" ").join('_').downcase + '.jpg'
  l.image.attach(
    io: File.open("./public/seeds_images/locations/#{path}"),
    filename: path,
    content_type: 'application/jpg',
  )
end




unless User.find_by(email: "admin")
  me = User.new(username: "Huntress", email: "admin", password: "password", rank_id: Rank.last.id)
  me.save!
end

unless User.find_by(email: "guest")
  you = User.new(username: "Guest", email: "guest", password: "guestpass", rank_id: Rank.first.id)
  you.save!
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