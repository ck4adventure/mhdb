json.id @group.id
json.name @group.name
json.mice @group.mice do |mouse|
  json.id mouse.id
  json.name mouse.name
end