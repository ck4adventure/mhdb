import { RECEIVE_LOCATIONS, RECEIVE_LOCATION } from '../actions/locations_actions';

const locationsReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState = {};
  switch (action.type) {
    case RECEIVE_LOCATIONS:
      action.locations.forEach(loc => nextState[loc.id] = loc)
      return nextState;
    case RECEIVE_LOCATION:
      let newLoc = {[action.location.id]: action.location}
      return Object.assign({}, state, newLoc);
    default:
      return state;
  }
}

export default locationsReducer;