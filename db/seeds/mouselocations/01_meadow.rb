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
  # puts mouse[:name]
  unless m.locations.include?(meadow) 
    MouseLocation.find_or_create_by!(location_id: meadow.id, mouse_id: m.id)
    # mouse[:items].each do |loot|
    #   # add loot to location

    # end
  end
end
