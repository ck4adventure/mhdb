
export const fetchItems = () => $.ajax({
  type: "GET",
  url: "api/items",
})

export const fetchItem = (item_id) => $.ajax({
  type: "GET",
  url: "api/items/${item_id}",
})

export const fetchWeapons = () => $.ajax({
  type: "GET",
  url: "api/items/weapons",
  dataType: 'json',
})

export const fetchWeapon = (id) => $.ajax({
  type: "GET",
  url: "api/items/${item_id}",
})

