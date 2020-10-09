json.array! @ranks do |rank|
  json.id rank.id
  json.title rank.title
  json.locations rank.locations, :id, :name
end