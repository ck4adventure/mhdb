
# windmill

windmill_mice = [
  "Brown",
  "Captain Croissant",
  "Diamond",
  "Dwarf",
  "Farmhand",
  "Field",
  "Flying",
  "Gold",
  "Grey",
  "Longtail",
  "Mole",
  "Pugilist",
  "Scruffy",
  "Silvertail",
  "Speedy",
  "Spud",
  "Tiny",
  "White",
]

windmill = Location.find_by!(name: "Windmill")
puts "Windmill mice locations"
windmill_mice.each do |name|
  puts name
  m = Mouse.find_by!(name: name)
  unless m.locations.include?(windmill) 
    MouseLocation.create!(location_id: windmill.id, mouse_id: m.id)
  end
end