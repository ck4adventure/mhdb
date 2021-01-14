# Group: Indigenous Mice
# Mice can have many locations, but are unique to their groups

indig_id = Group.find_by!(name: "Indigenous Mice").id

mice = [
  { name: "Black Widow Mouse", points: 480, gold: 10, group_id: indig_id,},
  { name: "Brown", points: 115, gold: 150, group_id: indig_id,},
  { name: "Burglar", points: 1250, gold: 1250, group_id: indig_id,},
  { name: "Captain Croissant", points: 1000, gold: 1000, group_id: indig_id,},
  { name: "Cowardly", points: 190, gold: 300, group_id: indig_id,},
  { name: "Crown Collector", points: 1000, gold: 1000, group_id: indig_id,},
  { name: "Dwarf", points: 225, gold: 450, group_id: indig_id,},
  { name: "Extreme Everysports", points: 2000, gold: 1000, group_id: indig_id,},
  { name: "Farmhand", points: 1000, gold: 1400, group_id: indig_id,},
  { name: "Field", points: 200, gold: 200, group_id: indig_id,},
  { name: "Flying", points: 450, gold: 450, group_id: indig_id,},
  { name: "Grey", points: 90, gold: 125, group_id: indig_id,},
  { name: "Hurdle", points: 500, gold: 500, group_id: indig_id,},
  { name: "Lightning Rod", points: 175, gold: 100, group_id: indig_id,},
  { name: "Longtail", points: 1000, gold: 900, group_id: indig_id,},
  { name: "Magic", points: 2000, gold: 1250, group_id: indig_id,},
  { name: "Master Burglar", points: 4260, gold: 2500, group_id: indig_id,},
  { name: "Nibbler", points: 1100, gold: 900, group_id: indig_id,},
  { name: "Pugilist", points: 700, gold: 600, group_id: indig_id,},
  { name: "Relic Hunter", points: 650, gold: 935, group_id: indig_id,},
  { name: "Scruffy", points: 250, gold: 400, group_id: indig_id,},
  { name: "Speedy", points: 950, gold: 900, group_id: indig_id,},
  { name: "Spotted", points: 175, gold: 175, group_id: indig_id,},
  { name: "Spud", points: 300, gold: 500, group_id: indig_id,},
  { name: "Steel", points: 270, gold: 500, group_id: indig_id,},
  { name: "Tiny", points: 200, gold: 450, group_id: indig_id,},
  { name: "Trampoline", points: 420, gold: 420, group_id: indig_id,},
  { name: "Wave Racer", points: 800, gold: 550, group_id: indig_id,},
  { name: "White", points: 70, gold: 100, group_id: indig_id,},
  { name: "Winter Games", points: 315, gold: 300, group_id: indig_id,},
]

mice.each do |mm|
  Mouse.find_or_create_by!(mm)
end
