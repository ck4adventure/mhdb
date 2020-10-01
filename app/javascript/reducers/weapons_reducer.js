import { RECEIVE_WEAPONS, RECEIVE_WEAPON } from '../actions/weapons_actions'


const weaponsReducer = (state = {}, action) => {
  Object.freeze(state)
  let nextState = {}
  switch (action.type) {
    case RECEIVE_WEAPON:
      nextState[action.weapon.power_type]= { [action.weapon.id]: weapon};
      return Object.assign({}, state, nextState);
    case RECEIVE_WEAPONS:
      Object.keys(action.weapons).forEach(ptype => {
        let p = {}
        if (!!action.weapons[ptype] && action.weapons[ptype].length > 0) {
          action.weapons[ptype].forEach(wep => {
            const w = { [wep.id]: wep }
            Object.assign(p, w);
          });
          let full = { [ptype]: p}
          Object.assign(nextState, full);
        }
      });
      return Object.assign({}, state, nextState);
    default:
      return state;
  }
}

export default weaponsReducer;