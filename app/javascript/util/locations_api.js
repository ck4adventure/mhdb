export const fetchLocations = () => $.ajax({
  type: "GET",
  url: "api/locations",
})

export const postLocation = (formData) => $.ajax({
  type: "POST",
  url: "api/locations",
  data: formData,
  contentType: false,
  processData: false,
})