# King's Arms is in Valour


mice = [
  "Bear",
  "Black Widow",
  "Chameleon",
  "Cherry",
  "Cyclops",
  "Dwarf",
  "Eagle Owl",
  "Elven Princess",
  "Foxy",
  "Frog",
  "Moosker",
  "Shaman",
  "Sylvan",
  "Treant",
  "Wiggler",
]

l = Location.find_by!(name: "Calm Clearing")
puts "calm clearing locations"
mice.each do |name|
  # puts name
  m = Mouse.find_by!(name: name)
  unless m.locations.include?(l) 
    MouseLocation.create!(location_id: l.id, mouse_id: m.id)
  end
end
