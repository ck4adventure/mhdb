json.array! @locations do |loc|
  json.id loc.id
  json.name loc.name 
  json.rank loc.rank.title
  json.region do
    json.id loc.region.id
    json.name loc.region.name
  end
end