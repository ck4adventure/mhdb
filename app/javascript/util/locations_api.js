export const fetchLocations = () => $.ajax({
  type: "GET",
  url: "api/locations",
})

export const postLocation = (location) => $.ajax({
  type: "POST",
  url: "api/locations",
  data: { location },
})