json.id @location.id
json.name @location.name
json.ipath @location.image_path
json.rank do 
  json.id @location.rank.id
  json.title @location.rank.title
  json.ipath @location.rank.image_path
end
json.region do
  json.id @location.region.id
  json.name @location.region.name
end