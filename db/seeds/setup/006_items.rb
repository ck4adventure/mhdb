# Items master list for Gnawnia Add
# gold, crafting items, purchasable items


# # gold will be special: 8
Item.find_or_create_by!(name: "Gold", itype: 8,)

# Needed for meadow mice loot
Item.find_or_create_by!(name: "Satchel of Gold (500)", itype: 5)
Item.find_or_create_by(name: "Ancient Relic", itype: 8,)

