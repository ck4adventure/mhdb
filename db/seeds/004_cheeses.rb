# Bait
cheeses = [
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
  {
    name: "Brie",
    itype: "bait",
  },
  {
    name: "Gouda",
    itype: "bait",
  },
    {
    name: "Marble String",
    itype: "bait",
  },
  {
    name: "Swiss String",
    itype: "bait",
  },
  {
    name: "Brie String",
    itype: "bait"
  },
  {
    name: "SUPER|brie+",
    itype: "bait",
  }

]

cheeses.each do |ch|
  Item.find_or_create_by(ch)
end
