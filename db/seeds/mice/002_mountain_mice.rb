# Group: Indigenous Mice
# Mice can have many locations, but are unique to their groups

mountain_id = Group.find_by!(name: "Mountain Mice").id

mice = [
  { name: "Abominable Snow", points: 5000, gold: 5000, group_id: mountain_id,},
  { name: "Craggy Ore", points: 1600, gold: 1000, group_id: mountain_id,},
  { name: "Diamond", points: 1200, gold: 600, group_id: mountain_id,},
  { name: "Fog", points: 800, gold: 800, group_id: mountain_id,},
  { name: "Frosty Snow", points: 600, gold: 300, group_id: mountain_id,},
  { name: "Frozen", points: 300, gold: 300, group_id: mountain_id,},
  { name: "Gold", points: 600, gold: 1200, group_id: mountain_id,},
  { name: "Granite", points: 285, gold: 525, group_id: mountain_id,},
  { name: "Mountain", points: 3000, gold: 1000, group_id: mountain_id,},
  { name: "Pebble", points: 200, gold: 600, group_id: mountain_id,},
  { name: "Silvertail", points: 1200, gold: 1200, group_id: mountain_id,},
  { name: "Slope Swimmer", points: 1600, gold: 1000, group_id: mountain_id,},
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
