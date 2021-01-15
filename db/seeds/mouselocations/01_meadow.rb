# Add mice to location
# Add items that mice drop

# 3 items needed here
satchel = Item.find_by!(name: "Satchel of Gold (500)")
marble = Item.find_by!(name: "Marble")
relic = Item.find_by!(name: "Ancient Relic")

meadow_mice = [
  { name: "Bionic", items: [satchel,] },
  { name: "Brown", items: [marble,] },
  { name: "Cowardly", items: [marble, satchel,] },
  { name: "Diamond", items: [satchel,] },
  { name: "Dwarf", items: [] },
  { name: "Field", items: [marble, satchel,] },
  { name: "Flying", items: [] },
  { name: "Gold", items: [marble,] },
  { name: "Granite", items: [marble, satchel,] },
  { name: "Grey", items: [marble,] },
  { name: "Lightning Rod", items: [marble,] },
  { name: "Mole", items: [marble, relic,] },
  { name: "Spotted", items: [marble, satchel,] },
  { name: "Steel", items: [marble, satchel,] },
  { name: "Tiny", items: [] },
  { name: "White", items: [marble,] },
]

meadow = Location.find_by!(name: "Meadow")
  puts "Meadow Mice Locations"
meadow_mice.each do |mouse|

  m = Mouse.find_by!(name: mouse[:name])
  puts mouse[:name]
  unless m.locations.include?(meadow) 
    MouseLocation.find_or_create_by!(location_id: meadow.id, mouse_id: m.id)
    # mouse[:items].each do |loot|
    #   # add loot to location

    # end
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

