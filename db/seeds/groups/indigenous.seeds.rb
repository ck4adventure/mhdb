
indig_id = Group.find_by!(name: "Indigenous Mice").id

mice = [
  { name: "Black Widow Mouse", points: 480, gold: 10, },
  { name: "Brown Mouse", points: 115, gold: 150, },
  { name: "Burglar Mouse", points: 1250, gold: 1250, },
  { name: "Captain Croissant Mouse", points: 1000, gold: 1000, },
  { name: "Cowardly Mouse", points: 190, gold: 300, },
  { name: "Crown Collector Mouse", points: 1000, gold: 1000, },
  { name: "Dwarf Mouse", points: 225, gold: 450, },
  { name: "Extreme Everysports Mouse", points: 2000, gold: 1000, },
  { name: "Farmhand Mouse", points: 1000, gold: 1400, },
  { name: "Field Mouse", points: 200, gold: 200, },
  { name: "Flying Mouse", points: 450, gold: 450, },
  { name: "Grey Mouse", points: 90, gold: 125, },
  { name: "Hurdle Mouse", points: 500, gold: 500, },
  { name: "Lightning Rod Mouse", points: 175, gold: 100, },
  { name: "Longtail Mouse", points: 1000, gold: 900, },
  { name: "Magic Mouse", points: 2000, gold: 1250, },
  { name: "Master Burglar Mouse", points: 4260, gold: 2500, },
  { name: "Nibbler Mouse", points: 1100, gold: 900, },
  { name: "Pugilist Mouse", points: 700, gold: 600, },
  { name: "Relic Hunter Mouse", points: 650, gold: 935, },
  { name: "Scruffy Mouse", points: 250, gold: 400, },
  { name: "Speedy Mouse", points: 950, gold: 900, },
  { name: "Spotted Mouse", points: 175, gold: 175, },
  { name: "Spud Mouse", points: 300, gold: 500, },
  { name: "Steel Mouse", points: 270, gold: 500, },
  { name: "Tiny Mouse", points: 200, gold: 450, },
  { name: "Trampoline Mouse", points: 420, gold: 420, },
  { name: "Wave Racer Mouse", points: 800, gold: 550, },
  { name: "White Mouse", points: 70, gold: 100, },
  { name: "Winter Games Mouse", points: 315, gold: 300, },
]

mice.each do |mm|
  m = Mouse.find_or_create_by!(mm)
end
