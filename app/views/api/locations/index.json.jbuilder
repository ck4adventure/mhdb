json.array! @locations do |loc|
  json.id loc.id
  json.name loc.name
  json.rank do 
    json.id loc.rank.id
    json.title loc.rank.title
    if loc.rank.image.attached?
      json.image url_for(loc.rank.image)
    end
  end
  json.region do
    json.id loc.region.id
    json.name loc.region.name
  end
  if loc.image.attached?
    json.image url_for(loc.image)
  end
end