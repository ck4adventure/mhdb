json.array! weapons do |weapon|
  json.partial! 'api/items/item', weapon: weapon
end