json.id @mouse.id
json.name @mouse.name
json.points @mouse.points
json.gold @mouse.gold
json.group @mouse.group.name
json.groupId @mouse.group.id
if @mouse.image.attached?
  json.image url_for(@mouse.image)
end