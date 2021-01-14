export const fetchGroups = () =>
  $.ajax({
    type: "GET",
    url: "api/groups",
  });
