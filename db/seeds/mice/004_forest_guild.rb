# Group: Indigenous Mice
# Mice can have many locations, but are unique to their groups

forest_id = Group.find_by!(name: "Forest Guild").id

mice = [
  { name: "Bear", points: 350, gold: 200, group_id: forest_id,},


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
