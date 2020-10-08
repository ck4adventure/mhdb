import { RECEIVE_LOCATIONS } from '../actions/locations_actions';

const locationsReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState = {};
  switch (action.type) {
    case RECEIVE_LOCATIONS:
      action.locations.forEach(loc => nextState[loc.id] = loc)
      return nextState;
    default:
      return state;
  }
}

export default locationsReducer;