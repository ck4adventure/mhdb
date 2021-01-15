# Group: Indigenous Mice
# Mice can have many locations, but are unique to their groups

group_id = Group.find_by!(name: "Digby Dirt Dwellers").id

mice = [
  { name: "Big Bad Burroughs", points: 22700, gold: 24500, group_id: group_id,},
  { name: "Core Sample", points: 2600, gold: 1000, group_id: group_id,},
  { name: "Demolitions", points: 4700, gold: 1900, group_id: group_id,},
  { name: "Industrious Digger", points: 3510, gold: 890, group_id: group_id,},
  { name: "Itty-Bitty Burroughs", points: 10000, gold: 4000, group_id: group_id,},
  { name: "Lambent Crystal", points: 9000, gold: 3000, group_id: group_id,},
  { name: "Miner", points: 5350, gold: 2000, group_id: group_id,},
  { name: "Mole", points: 550, gold: 500, group_id: group_id,},
  { name: "Nugget", points: 6875, gold: 550, group_id: group_id,},
  { name: "Rock Muncher", points: 2750, gold: 875, group_id: group_id,},
  { name: "Stone Cutter", points: 4360, gold: 1800, group_id: group_id,},
  { name: "Subterranean", points: 11000, gold: 5800, group_id: group_id,},
]


mice.each do |mm|
  m = Mouse.find_or_create_by!(mm)
  path = m.name.delete("'").split(" ").join('_').downcase + '.jpg'
  m.image.attach(
    io: File.open("./public/seeds_images/mice/#{path}"),
    filename: path,
    content_type: 'application/jpg',
  )
end
