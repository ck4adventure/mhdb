# Valour Locations
valour_id = Region.find_by!(name: "Valour").id
valour_locations = [
  {
    name: "King's Arms",
    rank_id: 3,
    region_id: valour_id,
    charm_shoppe: true,
    general_store: true,
    trapsmith: true,
  },
  {
    name: "Tournament Hall",
    rank_id: 3,
    region_id: valour_id,
    charm_shoppe: true,
    cheese_shoppe: true,
    general_store: true,
    trapsmith: true,
  },
  {
    name: "King's Gauntlet",
    rank_id: 9,
    region_id: valour_id,
    cartographer: true,
    cheese_shoppe: true,
    trapsmith: true,
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