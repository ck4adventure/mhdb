// export const fetchAllMice = () =>
//   $.ajax({
//     type: "GET",
//     url: "api/mice",
//   });

export const fetchMouse = (mouseId) =>
  $.ajax({
    type: "GET",
    url: `api/mice/${mouseId}`,
  });
