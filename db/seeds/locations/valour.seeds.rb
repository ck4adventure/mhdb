

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