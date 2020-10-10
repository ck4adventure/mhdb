json.array! @ranks do |rank|
  json.id rank.id
  json.title rank.title
  json.locations rank.locations do |loc|
    json.id  loc.id
    json.name loc.name
    json.ipath loc.image_path
  end
end