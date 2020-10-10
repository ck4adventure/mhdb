json.array! @locations do |loc|
  json.id loc.id
  json.name loc.name
  json.ipath loc.image_path
  json.rank do 
    json.id loc.rank.id
    json.title loc.rank.title
  end
  json.region do
    json.id loc.region.id
    json.name loc.region.name
  end
end