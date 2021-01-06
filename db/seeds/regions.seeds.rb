
# Regions are seldom added
mh_regions = [
 "Gnawnia",
 "Valour",
 "Whisker Woods",
 "Burroughs",
 "Furoma",
 "Bristle Woods",
 "Tribal Isles",
 "Varmint Valley",
 "Queso Canyon",
 "Rodentia",
 "Sandtail Desert",
 "Hollow Heights",
 "Rift Plane",
 "Other",
]

mh_regions.each do |region|
  Region.find_or_create_by!(name: region)
end