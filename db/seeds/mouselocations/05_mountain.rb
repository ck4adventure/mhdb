# TODO: Abominable Snow, Bionic, Craggy Ore, Frosty Snow
# Mountain, Ninja, Slope Swimmer, Zombie

# indigenous meadow mice only
mountain_mice = [
  "Black Widow",
  "Brown",
  "Burglar",
  "Diamond",
  "Dwarf",
  "Fog",
  "Frozen",
  "Gold",
  "Granite",
  "Grey",
  "Pebble",
  "Silvertail",
  "Steel",
  "White",
]

loc_id = Location.find_by!(name: "Mountain").id

mountain_mice.each do |name|
  m = Mouse.find_by!(name: name)
  unless m.mouse_locations.pluck("id").include?(loc_id) 
    ml = MouseLocation.create!(location_id: loc_id, mouse_id: m.id)
  end
end









# Traps
# first_traps = [
#   {
#     name: "500 Pound Spiked Crusher",
#     itype: "weapon",
#     power_type: "physical",
#     power: 250,
#     p_bonus: 10,
#     attr_bonus: 0,
#     luck: 1,
#     cheese_effect: "no_effect"
#   },
#   {
#     name: "Mouse Trebuchet",
#     itype: "weapon",
#     power_type: "physical",
#     power: 600,
#     p_bonus: 2,
#     attr_bonus: 4,
#     luck: 1,
#     cheese_effect: "very_fresh"
#   },
#   {
#     name: "Mouse Deathbot",
#     itype: "weapon",
#     power_type: "physical",
#     power: 2400,
#     p_bonus: 15,
#     attr_bonus: 10,
#     luck: 2,
#     cheese_effect: "stale"
#   },
#   {
#     name: "Wooden Base with Target",
#     itype: "base",
#     power: 75,
#     p_bonus: 0,
#     attr_bonus: 20,
#     luck: 0,
#     cheese_effect: "no_effect"
#   },
#   {
#     name: "Stone Base",
#     itype: "base",
#     power: 150,
#     p_bonus: 10,
#     attr_bonus: 0,
#     luck: 0,
#     cheese_effect: "fresh"
#   },
#   {
#     name: "Explosive Base",
#     itype: "base",
#     power: 300,
#     p_bonus: 5,
#     attr_bonus: 5,
#     luck: 0,
#     cheese_effect: "stale"
#   },
# ]

# first_traps.each do |item|
#   w = Item.find_or_create_by(item)
# end

