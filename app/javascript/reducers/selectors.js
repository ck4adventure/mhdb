export const toArray =  items  => {
  if (items) {
    return Object.keys(items).map(key => items[key]);
  } else {
    return [];
  }
};

export const byPowerType = (weapons, ptype) => {
  if (weapons){
    return Object.keys(weapons).filter(id => weapons[id].power_type == ptype).map(id => weapons[id]);
  } else {
    return [];
  }
}