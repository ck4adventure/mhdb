
town_mice = [
  "Bionic",
  "Brown",
  "Cowardly",
  "Diamond",
  "Dwarf",
  "Flying",
  "Gold",
  "Granite",
  "Grey",
  "Longtail",
  "Magic",
  "Master Burglar",
  "Nibbler",
  "Pugilist",
  "Silvertail",
  "Speedy",
  "Steel",
  "White",
  "Zombie",
]

town = Location.find_by!(name: "Town of Gnawnia")
puts "Town of Gnawnia Mice Locations"
town_mice.each do |name|
  # puts name
  m = Mouse.find_by!(name: name)
  unless m.locations.include?(town) 
    MouseLocation.find_or_create_by!(location_id: town.id, mouse_id: m.id)
  end
end
