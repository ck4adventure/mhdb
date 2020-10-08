export const fetchRegions = () => $.ajax({
  type: "GET",
  url: "api/regions",
})
