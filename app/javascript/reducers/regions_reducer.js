import { RECEIVE_REGIONS } from '../actions/regions_actions';

const regionsReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState = {}
  switch (action.type) {
    case RECEIVE_REGIONS:
      action.regions.forEach(region => nextState[region.id] = region);
      return nextState;
    default:
      return state;
  }
}

export default regionsReducer;