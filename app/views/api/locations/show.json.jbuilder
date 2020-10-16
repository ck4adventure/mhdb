json.id @location.id
json.name @location.name
json.image url_for(@location.image)
json.rank do 
  json.id @location.rank.id
  json.title @location.rank.title
  json.ipath @location.rank.image_path
end
json.region do
  json.id @location.region.id
  json.name @location.region.name
end