# Group: Indigenous Mice
# Mice can have many locations, but are unique to their groups

lab_id = Group.find_by!(name: "Lab Experiments").id

mice = [
  { name: "Bionic", points: 550, gold: 550, group_id: lab_id,},
  { name: "Clumsy Chemist", points: 525, gold: 700, group_id: lab_id,},
  { name: "Monster", points: 3500, gold: 3500, group_id: lab_id,},
  { name: "Mutated Brown", points: 700, gold: 700, group_id: lab_id,},
  { name: "Mutated Grey", points: 500, gold: 500, group_id: lab_id,},
  { name: "Mutated Mole", points: 3000, gold: 6000, group_id: lab_id,},
  { name: "Mutated White", points: 450, gold: 475, group_id: lab_id,},
  { name: "Sludge Scientist", points: 465, gold: 525, group_id: lab_id,},
  { name: "Squeaker Bot", points: 400, gold: 650, group_id: lab_id,},
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
