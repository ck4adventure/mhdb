export const fetchAllGroups = () =>
  $.ajax({
    type: "GET",
    url: "api/groups",
  });

export const fetchGroup = (groupId) =>
  $.ajax({
    type: "GET",
    url: `api/groups/${groupId}`,
  });
