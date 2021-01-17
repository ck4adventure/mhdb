# Great Gnarled Tree


mice = [
  "Bat",
  "Bear",
  "Black Widow",
  "Centaur",
  "Chameleon",
  "Curious Chemist",
  "Dwarf",
  "Eagle Owl",
  "Elven Princess",
  "Fairy",
  "Foxy",
  "Frog",
  "Goldleaf",
  "Moosker",
  "Nibbler",
  "Nomad",
  "Shaman",
  "Sylvan",
  "Tiger",
  "Treant",
  "Wicked Witch of Whisker Woods",
  "Wiggler",
]

l = Location.find_by!(name: "Great Gnarled Tree")
puts "ggt locs"
mice.each do |name|
  # puts name
  m = Mouse.find_by!(name: name)
  unless m.locations.include?(l) 
    MouseLocation.create!(location_id: l.id, mouse_id: m.id)
  end
end
