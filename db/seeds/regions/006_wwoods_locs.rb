# Whisker Woods Locations

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

