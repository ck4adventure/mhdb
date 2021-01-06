# Just a few mice to get started
meadow_mice = [
  {
    name: "White",
    points: 70,
    gold: 100,
  },
  {
    name: "Grey",
    points: 90,
    gold: 125,
  },
  {
    name: "Brown",
    points: 115,
    gold: 150,
  },
  {
    name: "Lightning Rod",
    points: 175,
    gold: 100,
  },
]

meadow_mice.each do |mm|
  m = Mouse.find_or_create_by!(mm)
  l = MouseLocation.new(location_id: 1, mouse_id: m.id)
  l.save! if l.valid?
end
