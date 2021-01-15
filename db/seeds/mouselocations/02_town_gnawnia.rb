

# TODO Bionic Mouse (lab group)   "Silvertail",
# TODO Zombie (shadow clan),   "Diamond",   "Gold",   "Granite",

# indigenous meadow mice only
town_mice = [
  "Brown",
  "Cowardly",
  "Dwarf",
  "Field",
  "Flying",
  "Grey",
  "Longtail",
  "Magic",
  "Master Burglar",
  "Nibbler",
  "Pugilist",
  "Speedy",
  "Steel",
  "White",
]

town = Location.find_by!(name: "Town of Gnawnia")
  puts "Town of Gnawnia Mice Locations"
town_mice.each do |name|

  puts name
  m = Mouse.find_by!(name: name)
  unless m.locations.include?(town) 
    MouseLocation.find_or_create_by!(location_id: town.id, mouse_id: m.id)
  end
end
