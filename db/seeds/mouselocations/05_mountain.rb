# TODO: Abominable Snow, Bionic, Craggy Ore, Frosty Snow
# Mountain, Ninja, Slope Swimmer, Zombie

# indigenous meadow mice only
mountain_mice = [
  "Black Widow",
  "Brown",
  "Burglar",
  "Diamond",
  "Dwarf",
  "Fog",
  "Frozen",
  "Gold",
  "Granite",
  "Grey",
  "Pebble",
  "Silvertail",
  "Steel",
  "White",
]

mountain = Location.find_by!(name: "Mountain")
puts "mountain mice locations"
mountain_mice.each do |name|
  puts name
  m = Mouse.find_by!(name: name)
  unless m.locations.include?(mountain) 
    MouseLocation.create!(location_id: mountain.id, mouse_id: m.id)
  end
end
