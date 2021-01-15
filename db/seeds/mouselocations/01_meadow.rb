# Add mice to location
# Add items that mice drop

# TODO: Bionic (lab group),   { name: "Diamond", items: ["Marble", "Satchel of Gold (500)",] },
#{ name: "Gold", items: ["Marble", "Satchel of Gold (500)",] },  { name: "Granite", items: ["Marble", "Satchel of Gold (500)",] },
#   { name: "Mole", items: ["Marble", "Satchel of Gold (500)",] },
meadow_mice = [
  { name: "Brown", items: ["Marble", "Satchel of Gold (500)",] },
  { name: "Cowardly", items: ["Marble", "Satchel of Gold (500)",] },
  { name: "Dwarf", items: ["Marble", "Satchel of Gold (500)",] },
  { name: "Field", items: ["Marble", "Satchel of Gold (500)",] },
  { name: "Flying", items: ["Marble", "Satchel of Gold (500)",] },
  { name: "Grey", items: ["Marble", "Satchel of Gold (500)",] },
  { name: "Lightning Rod", items: ["Marble", "Satchel of Gold (500)",] },
  { name: "Spotted", items: ["Marble", "Satchel of Gold (500)",] },
  { name: "Steel", items: ["Marble", "Satchel of Gold (500)",] },
  { name: "Tiny", items: ["Marble", "Satchel of Gold (500)",] },
  { name: "White", items: ["Marble", "Satchel of Gold (500)",] },
]

meadow = Location.find_by!(name: "Meadow")
  puts "Meadow Mice Locations"
meadow_mice.each do |mouse|

  m = Mouse.find_by!(name: mouse[:name])
  puts mouse[:name]
  unless m.locations.include?(meadow) 
    ml = MouseLocation.find_or_create_by!(location_id: meadow.id, mouse_id: m.id)
    mouse[:items].each do |loot|
      # add loot to location

    end
  end
end

# items dropped in the Meadow
# Satchel of Gold
# Marble Cheese







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

