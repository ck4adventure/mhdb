# Add mice to location
# Add items that mice drop
# Add items that location sells
# Add items that can be created by smashing above adds
# Add items that can be crafted from all of the above

meadow_mice = [
  "Brown",
  "Cowardly",
  "Diamond",
  "Dwarf",
  "Field",
  "Flying",
  "Gold",
  "Granite",
  "Grey",
  "Lightning Rod",
  "Mole",
  "Spotted",
  "Steel",
  "Tiny",
  "White",
]

loc_id = Location.find_by!(name: "Meadow").id

meadow_mice.each do |name|
  m = Mouse.find_by!(name: name)
  unless m.mouse_locations.pluck("id").include?(loc_id) 
    ml = MouseLocation.create!(location_id: loc_id, mouse_id: m.id)
  end
end