json.array! @regions do |region|
  json.id region.id
  json.name region.name
  json.locations region.locations do |loc|
    json.id  loc.id
    json.name loc.name
    if loc.image.attached?
      json.image url_for(loc.image)
    end
  end
end