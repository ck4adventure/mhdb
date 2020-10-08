json.array! @locations do |loc|
  json.id loc.id
  json.name loc.name 
  json.rank loc.rank.title
  json.region loc.region.name
end