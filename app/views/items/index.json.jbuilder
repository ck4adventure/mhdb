json.items @items do |item|
  json.id item.id
  json.category item.category.name
  json.name item.name
end