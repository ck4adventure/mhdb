import { 
  RECEIVE_LOCATION_ERRORS, 
  RECEIVE_LOCATION, 
  RECEIVE_LOCATIONS 
} from '../actions/locations_actions';

const locationErrorsReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_LOCATION_ERRORS:
      return action.errors
    case RECEIVE_LOCATION:
    case RECEIVE_LOCATIONS:
      return null;
    default:
      return state;
  }
}

export default locationErrorsReducer;