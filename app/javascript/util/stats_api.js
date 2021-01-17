export const fetchStats = () =>
  $.ajax({
    type: "GET",
    url: "api/stats",
  });
