export const postUser = (user) => ($.ajax({
  type: "POST",
  url: "api/users",
  data: { user },
}));

export const postSession = (user) => ($.ajax({
  type: "POST",
  url: '/api/session',
  dataType: 'json',
  data: { user },
}));

export const deleteSession = () => ($.ajax({
  type: "DELETE",
  url: '/api/session'
}));