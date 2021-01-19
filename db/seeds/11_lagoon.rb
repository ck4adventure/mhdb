# Lagoon

#   "Hydra",  "Water Nymph",
mice = [
  "Black Widow",
  "Centaur",
  "Cyclops",
  "Eagle Owl",
  "Elven Princess",
  "Fairy",
  "Goblin",
  "Harpy",
  "Nomad",
  "Shaman",
  "Silth",
  "Tiger",
  "Treant",
  "Troll",
  "Wicked Witch of Whisker Woods",
]

l = Location.find_by!(name: "Lagoon")
puts "lagoon locs"
mice.each do |name|
  puts name
  m = Mouse.find_by!(name: name)
  unless m.locations.include?(l) 
    MouseLocation.create!(location_id: l.id, mouse_id: m.id)
  end
end
