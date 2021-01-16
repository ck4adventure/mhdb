# Group: Followers of Furoma
# Mice can have many locations, but are unique to their groups

group_id = Group.find_by!(name: "Followers of Furoma").id

mice = [
  { name: "Archer", points: 4500, gold: 750, group_id: group_id,},
  { name: "Assassin", points: 5000, gold: 3400, group_id: group_id,},
  { name: "Dojo Sensei", points: 28665, gold: 34500, group_id: group_id,},
  { name: "Dumpling Chef", points: 2886, gold: 3000, group_id: group_id,},
  { name: "Hapless", points: 50, gold: 70, group_id: group_id,},
  { name: "Kung Fu", points: 4750, gold: 800, group_id: group_id,},
  { name: "Master of the Cheese Belt", points: 7200, gold: 900, group_id: group_id,},
  { name: "Master of the Cheese Claw", points: 7200, gold: 900, group_id: group_id,},
  { name: "Master of the Cheese Fang", points: 7200, gold: 900, group_id: group_id,},
  { name: "Master of the Dojo", points: 15925, gold: 27300, group_id: group_id,},
  { name: "Monk", points: 5250, gold: 950, group_id: group_id,},
  { name: "Ninja", points: 2750, gold: 350, group_id: group_id,},
  { name: "Samurai", points: 5000, gold: 850, group_id: group_id,},
  { name: "Student of the Cheese Belt", points: 6250, gold: 450, group_id: group_id,},
  { name: "Student of the Cheese Claw", points: 6250, gold: 450, group_id: group_id,},
  { name: "Student of the Cheese Fang", points: 6250, gold: 450, group_id: group_id,},
  { name: "Worker", points: 300, gold: 2200, group_id: group_id,},
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
