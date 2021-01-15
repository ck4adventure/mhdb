

# TODO Barmy Gunner, Bilged Boatswain, Cabin Boy, Corrupt Commodore
# Dashing Buccaneer, Pirate (Pirate Bounties later game update)
#   "Bionic",
# indigenous mice only
harbour_mice = [
  "Black Widow",
  "Brown",
  "Burglar",
  "Diamond",
  "Dwarf",
  "Fog",
  "Gold",
  "Granite",
  "Grey",
  "Magic",
  "Pugilist",
  "Scruffy",
  "Silvertail",
  "Spotted",
  "Steel",
  "White",
]

harbour = Location.find_by!(name: "Harbour")
  puts "harbour mice locations"
harbour_mice.each do |name|

  puts name
  m = Mouse.find_by!(name: name)
  unless m.locations.include?(harbour) 
    MouseLocation.create!(location_id: harbour.id, mouse_id: m.id)
  end
end