export const fetchLocations = () => $.ajax({
  type: "GET",
  url: "api/locations",
})