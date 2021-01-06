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