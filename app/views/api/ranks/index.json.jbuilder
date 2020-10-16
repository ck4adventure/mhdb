json.array! @ranks do |rank|
  json.id rank.id
  json.title rank.title
  if rank.image.attached?
    json.image url_for(rank.image)
  end
  json.locations rank.locations do |loc|
    json.id  loc.id
    json.name loc.name
    if loc.image.attached?
      json.image url_for(loc.image)
    end
  end
end