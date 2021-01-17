# Tournament Hall is in Valour


mice = [
  "Burglar",
  "Diamond",
  "Dwarf",
  "Extreme Everysports",
  "Flying",
  "Gold",
  "Hurdle",
  "Lightning Rod",
  "Nibbler",
  "Pugilist",
  "Silvertail",
  "Speedy",
  "Trampoline",
  "Wave Racer",
  "Winter Games",
]

l = Location.find_by!(name: "Tournament Hall")
puts "tourney hall locations"
mice.each do |name|
  # puts name
  m = Mouse.find_by!(name: name)
  unless m.locations.include?(l) 
    MouseLocation.create!(location_id: l.id, mouse_id: m.id)
  end
end
