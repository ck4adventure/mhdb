# Bait
meadow_cheeses = [
  {
    name: "Cheddar",
    itype: "bait",
  },
  {
    name: "Marble",
    itype: "bait",
  },
  {
    name: "Swiss",
    itype: "bait",
  },
]

meadow_cheeses.each do |ch|
  bait = Item.find_or_create_by(ch)
end