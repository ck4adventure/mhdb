export const postUser = (user) => ($.ajax({
  type: "POST",
  url: "api/user",
  data: { user },
}));

export const postSession = (user) => ($.ajax({
  type: "POST",
  url: '/api/session',
  data: { user },
}));

export const deleteSession = () => ($.ajax({
  type: "DELETE",
  url: '/api/session'
}));