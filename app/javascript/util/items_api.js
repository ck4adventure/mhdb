export const fetchItems = () =>
  $.ajax({
    type: "GET",
    url: "api/items",
  });

export const fetchItem = (item_id) =>
  $.ajax({
    type: "GET",
    url: "api/items/${item_id}",
  });

export const fetchWeapons = () =>
  $.ajax({
    type: "GET",
    url: "api/items/weapons",
    dataType: "json",
  });

export const fetchWeapon = (item_id) =>
  $.ajax({
    type: "GET",
    url: "api/items/${item_id}",
  });

export const fetchBases = () =>
  $.ajax({
    type: "GET",
    url: "api/items/bases",
    dataType: "json",
  });

export const fetchBase = (item_id) =>
  $.ajax({
    type: "GET",
    url: "api/items/${item_id}",
  });
