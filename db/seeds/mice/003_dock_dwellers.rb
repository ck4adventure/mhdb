# Group: Indigenous Mice
# Mice can have many locations, but are unique to their groups

dock_id = Group.find_by!(name: "Dock Dwellers").id

mice = [
  { name: "Barmy Gunner", points: 350, gold: 200, group_id: dock_id,},
  { name: "Bilged Boatswain", points: 350, gold: 250, group_id: dock_id,},
  { name: "Cabin Boy", points: 270, gold: 100, group_id: dock_id,},
  { name: "Corrupt Commodore", points: 400, gold: 600, group_id: dock_id,},
  { name: "Dashing Buccaneer", points: 375, gold: 250, group_id: dock_id,},
  { name: "Pirate", points: 350, gold: 2750, group_id: dock_id,},

]

mice.each do |mm|
  Mouse.find_or_create_by!(mm)
end
