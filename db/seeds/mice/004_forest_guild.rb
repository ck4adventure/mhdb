# Group: Indigenous Mice
# Mice can have many locations, but are unique to their groups

forest_id = Group.find_by!(name: "Forest Guild").id

mice = [
  { name: "Bear", points: 310, gold: 575, group_id: forest_id,},
  { name: "Centaur", points: 3800, gold: 960, group_id: forest_id,},
  { name: "Chameleon", points: 250, gold: 550, group_id: forest_id,},
  { name: "Cherry", points: 6000, gold: 3000, group_id: forest_id,},
  { name: "Curious Chemist", points: 2400, gold: 400, group_id: forest_id,},
  { name: "Cyclops", points: 2800, gold: 2800, group_id: forest_id,},
  { name: "Eagle Owl", points: 5300, gold: 2250, group_id: forest_id,},
  { name: "Elven Princess", points: 2700, gold: 400, group_id: forest_id,},
  { name: "Fairy", points: 5775, gold: 930, group_id: forest_id,},
  { name: "Foxy", points: 1650, gold: 1500, group_id: forest_id,},
  { name: "Frog", points: 325, gold: 400, group_id: forest_id,},
  { name: "Goblin", points: 3500, gold: 3500, group_id: forest_id,},
  { name: "Goldleaf", points: 5500, gold: 2450, group_id: forest_id,},
  { name: "Harpy", points: 11100, gold: 3100, group_id: forest_id,},
  { name: "Moosker", points: 80, gold: 125, group_id: forest_id,},
  { name: "Nomad", points: 3400, gold: 5000, group_id: forest_id,},
  { name: "Shaman", points: 600, gold: 1300, group_id: forest_id,},
  { name: "Silth", points: 25450, gold: 15200, group_id: forest_id,},
  { name: "Sylvan", points: 275, gold: 425, group_id: forest_id,},
  { name: "Tiger", points: 5500, gold: 935, group_id: forest_id,},
  { name: "Treant", points: 1300, gold: 600, group_id: forest_id,},
  { name: "Troll", points: 8190, gold: 8190, group_id: forest_id,},
  { name: "Wicked Witch of Whisker Woods", points: 400, gold: 2700, group_id: forest_id,},
  { name: "Wiggler", points: 100, gold: 150, group_id: forest_id,},

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
