# TODO: 
# Mountain, Ninja, Slope Swimmer, Zombie

# indigenous meadow mice only
mountain_mice = [
  "Abominable Snow", 
  "Bionic",
  "Black Widow",
  "Brown",
  "Burglar",
  "Craggy Ore",
  "Diamond",
  "Dwarf",
  "Fog",
  "Frosty Snow",
  "Frozen",
  "Gold",
  "Granite",
  "Grey",
  "Mountain",
  "Ninja",
  "Pebble",
  "Silvertail",
  "Slope Swimmer",
  "Steel",
  "White",
  "Zombie",
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
