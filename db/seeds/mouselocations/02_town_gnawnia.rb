# Add mice to location
# Add items that mice drop
# Add items that location sells
# Add items that can be created by smashing above adds
# Add items that can be crafted from all of the above

# Ensure Mouse Locations Set
# Create/Find Item
# Add Item Exchange
# Add Item Exchange Location
# Add Exchange Costs
# Add Item to LootLocations

# TODO Bionic Mouse (lab group)   "Silvertail",
# TODO Zombie (shadow clan),   "Diamond",   "Gold",   "Granite",

# indigenous meadow mice only
town_mice = [
  "Brown",
  "Cowardly",
  "Dwarf",
  "Field",
  "Flying",
  "Grey",
  "Longtail",
  "Magic",
  "Master Burglar",
  "Nibbler",
  "Pugilist",
  "Speedy",
  "Steel",
  "White",
]

town = Location.find_by!(name: "Town of Gnawnia")

town_mice.each do |name|
  m = Mouse.find_by!(name: name)
  puts name
  unless m.locations.include?(town) 
    ml = MouseLocation.find_or_create_by!(location_id: town.id, mouse_id: m.id)
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

