json.id @location.id
json.name @location.name
json.rank do 
  json.id @location.rank.id
  json.title @location.rank.title
  if @location.rank.image.attached?
    json.image url_for(@location.rank.image)
  end
end
json.region do
  json.id @location.region.id
  json.name @location.region.name
end
if @location.image.attached?
  json.image url_for(@location.image)
end
if @location.mice.length > 0
  json.mice @location.mice do |mouse|
    json.id mouse.id
    json.name mouse.name
    json.points mouse.points
    json.gold mouse.gold
  end
end