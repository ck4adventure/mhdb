// export const fetchAllMice = () =>
//   $.ajax({
//     type: "GET",
//     url: "api/mice",
//   });

export const fetchAMouse = (mouseId) =>
  $.ajax({
    type: "GET",
    url: `api/mice/${mouseId}`,
  });
