import * as ItemsApiUtil from '../util/items_api';

export const RECEIVE_WEAPONS = "RECEIVE_WEAPONS";
export const RECEIVE_WEAPON = "RECEIVE_WEAPON";

// sync actions
export const receiveWeapons = weapons => ({
  type: RECEIVE_WEAPONS,
  weapons
});

export const receiveWeapon = weapon => ({
  type: RECEIVE_WEAPON,
  weapon
});


// async actions
export const fetchWeapons = () => dispatch => (
  ItemsApiUtil.fetchWeapons()
    .then(
      weapons => dispatch(receiveWeapons(weapons)),
    )
);

export const fetchWeapon = (id) => dispatch => (
  ItemsApiUtil.fetchItem(id).then(weapon => dispatch(receiveWeapon(weapon)))
);

