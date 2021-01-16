export const fetchLocations = () =>
  $.ajax({
    type: "GET",
    url: "api/locations",
  });

export const getLocation = (id) =>
  $.ajax({
    type: "GET",
    url: `api/locations/${id}`,
  });

export const postLocation = (formData) =>
  $.ajax({
    type: "POST",
    url: "api/locations",
    data: formData,
    contentType: false,
    processData: false,
  });

export const putLocation = (id, formData) =>
  $.ajax({
    type: "PUT",
    url: `api/locations/${id}`,
    data: formData,
    contentType: false,
    processData: false,
  });
