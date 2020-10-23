import { RECEIVE_REGIONS } from '../actions/regions_actions';
import { RECEIVE_LOCATION } from '../actions/locations_actions';

// regions:
//   1:
//     id: 1
//     locations: [2, 4, 9]

const regionsReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState = {}
  switch (action.type) {
    case RECEIVE_REGIONS:
      action.regions.forEach(region => nextState[region.id] = region);
      return nextState;
    case RECEIVE_LOCATION:
      // configured for add only, no editing region once set, will dup
      let newRegion = Object.assign({}, state[action.location.region.id]);
      console.log(newRegion.locations)
      if (newRegion.locations.includes(action.location.id)){
        return state;
      } else {
        const newLocs = newRegion.locations.concat([{id: action.location.id}])
        newRegion.locations = newLocs
        return Object.assign({}, state,  {[newRegion.id]: newRegion })
      }
    default:
      return state;
  }
}

export default regionsReducer;