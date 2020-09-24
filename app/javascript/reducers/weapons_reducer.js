import { RECEIVE_WEAPONS, RECEIVE_WEAPON } from '../actions/weapons_actions'

const weaponsReducer = (state = {}, action) => {
  Object.freeze(state)
  let nextState = {}
  switch (action.type) {
    case RECEIVE_WEAPON:
      nextState[action.weapon.id] = weapon;
      return Object.assign({}, state, nextState);
    case RECEIVE_WEAPONS:
      action.weapons.forEach(weapon => nextState[weapon.id] = weapon)
      return nextState;
    default:
      return state;
  }
}

export default weaponsReducer;