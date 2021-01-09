# Gnawnia Locations List
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