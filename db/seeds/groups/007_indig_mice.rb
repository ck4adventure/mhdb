# Group: Indigenous Mice
# Mice can have many locations, but are unique to their groups

indig_id = Group.find_by!(name: "Indigenous Mice").id

mice = [
  { name: "Black Widow Mouse", points: 480, gold: 10, group_id: indig_id,},
  { name: "Brown Mouse", points: 115, gold: 150, group_id: indig_id,},
  { name: "Burglar Mouse", points: 1250, gold: 1250, group_id: indig_id,},
  { name: "Captain Croissant Mouse", points: 1000, gold: 1000, group_id: indig_id,},
  { name: "Cowardly Mouse", points: 190, gold: 300, group_id: indig_id,},
  { name: "Crown Collector Mouse", points: 1000, gold: 1000, group_id: indig_id,},
  { name: "Dwarf Mouse", points: 225, gold: 450, group_id: indig_id,},
  { name: "Extreme Everysports Mouse", points: 2000, gold: 1000, group_id: indig_id,},
  { name: "Farmhand Mouse", points: 1000, gold: 1400, group_id: indig_id,},
  { name: "Field Mouse", points: 200, gold: 200, group_id: indig_id,},
  { name: "Flying Mouse", points: 450, gold: 450, group_id: indig_id,},
  { name: "Grey Mouse", points: 90, gold: 125, group_id: indig_id,},
  { name: "Hurdle Mouse", points: 500, gold: 500, group_id: indig_id,},
  { name: "Lightning Rod Mouse", points: 175, gold: 100, group_id: indig_id,},
  { name: "Longtail Mouse", points: 1000, gold: 900, group_id: indig_id,},
  { name: "Magic Mouse", points: 2000, gold: 1250, group_id: indig_id,},
  { name: "Master Burglar Mouse", points: 4260, gold: 2500, group_id: indig_id,},
  { name: "Nibbler Mouse", points: 1100, gold: 900, group_id: indig_id,},
  { name: "Pugilist Mouse", points: 700, gold: 600, group_id: indig_id,},
  { name: "Relic Hunter Mouse", points: 650, gold: 935, group_id: indig_id,},
  { name: "Scruffy Mouse", points: 250, gold: 400, group_id: indig_id,},
  { name: "Speedy Mouse", points: 950, gold: 900, group_id: indig_id,},
  { name: "Spotted Mouse", points: 175, gold: 175, group_id: indig_id,},
  { name: "Spud Mouse", points: 300, gold: 500, group_id: indig_id,},
  { name: "Steel Mouse", points: 270, gold: 500, group_id: indig_id,},
  { name: "Tiny Mouse", points: 200, gold: 450, group_id: indig_id,},
  { name: "Trampoline Mouse", points: 420, gold: 420, group_id: indig_id,},
  { name: "Wave Racer Mouse", points: 800, gold: 550, group_id: indig_id,},
  { name: "White Mouse", points: 70, gold: 100, group_id: indig_id,},
  { name: "Winter Games Mouse", points: 315, gold: 300, group_id: indig_id,},
]

mice.each do |mm|
  m = Mouse.find_or_create_by!(mm)
  m.update(group_id: indig_id)
end
