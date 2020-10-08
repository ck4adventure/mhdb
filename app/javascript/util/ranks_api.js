export const fetchRanks = () => $.ajax({
  type: "GET",
  url: "api/ranks",
})
