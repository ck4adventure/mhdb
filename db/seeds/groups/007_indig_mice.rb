# Group: Indigenous Mice

indig_id = Group.find_by!(name: "Indigenous Mice").id
# Just a few mice to get started
indig_mice = [
  {
    name: "White Mouse",
    points: 70,
    gold: 100,
    group_id: indig_id,
  },
  {
    name: "Grey Mouse",
    points: 90,
    gold: 125,
    group_id: indig_id,
  },
  {
    name: "Brown Mouse",
    points: 115,
    gold: 150,
    group_id: indig_id,
  },
  {
    name: "Lightning Rod Mouse",
    points: 175,
    gold: 100,
    group_id: indig_id,
  },
]

indig_mice.each do |mm|
  m = Mouse.find_or_create_by!(mm)
end