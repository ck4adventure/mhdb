json.array! @regions do |region|
  json.id region.id
  json.name region.name
  json.locations region.locations do |loc|
    json.id  loc.id
    json.name loc.name
    json.ipath loc.image_path
  end
end