# Group: Indigenous Mice
# Mice can have many locations, but are unique to their groups

sh_id = Group.find_by!(name: "The Shadow Clan").id

mice = [
  { name: "Bat", points: 3000, gold: 3000, group_id: sh_id,},
  { name: "Coffin Zombie", points: 2200, gold: 3000, group_id: sh_id,},
  { name: "Ghost", points: 3250, gold: 3500, group_id: sh_id,},
  { name: "Giant Snail", points: 5750, gold: 550, group_id: sh_id,},
  { name: "Gluttonous Zombie", points: 1500, gold: 2500, group_id: sh_id,},
  { name: "Lycan", points: 9250, gold: 5500, group_id: sh_id,},
  { name: "Mousevina von Vermin", points: 5000, gold: 9000, group_id: sh_id,},
  { name: "Mummy", points: 3750, gold: 3500, group_id: sh_id,},
  { name: "Ravenous Zombie", points: 3000, gold: 4000, group_id: sh_id,},
  { name: "Vampire", points: 1400, gold: 900, group_id: sh_id,},
  { name: "Zombie", points: 2000, gold: 1900, group_id: sh_id,},
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
