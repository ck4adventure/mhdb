json.id @mouse.id
json.name @mouse.name
json.points @mouse.points
json.gold @mouse.gold
json.group @mouse.group.name
json.groupId @mouse.group.id
if @mouse.image.attached?
  json.image url_for(@mouse.image)
end
if @mouse.locations.length > 0
  json.locations @mouse.locations do |location|
    json.name location.name
    json.id location.id
    if location.image.attached?
      json.image url_for(location.image)
    end
  end
end