# King's Arms is in Valour


mice = [
  "Black Widow",
  "Brown",
  "Burglar",
  "Crown Collector",
  "Diamond",
  "Dwarf",
  "Flying",
  "Gold",
  "Grey",
  "Longtail",
  "Magic",
  "Nibbler",
  "Pugilist",
  "Scruffy",
  "Silvertail",
  "Speedy",
  "Spotted",
  "White",
  "Tiny",
]

l = Location.find_by!(name: "King's Arms")
puts "king's arm locations"
mice.each do |name|
  # puts name
  m = Mouse.find_by!(name: name)
  unless m.locations.include?(l) 
    MouseLocation.create!(location_id: l.id, mouse_id: m.id)
  end
end
