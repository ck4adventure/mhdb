json.id @location.id
json.name @location.name
if @location.image.attached?
  json.image url_for(@location.image)
end
json.rank do 
  json.id @location.rank.id
  json.title @location.rank.title
  json.ipath @location.rank.image_path
end
json.region do
  json.id @location.region.id
  json.name @location.region.name
end