import { 
  RECEIVE_LOCATION_ERRORS, 
  RECEIVE_LOCATION, 
  RECEIVE_LOCATIONS 
} from '../actions/locations_actions';

const locationErrorsReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_LOCATION_ERRORS:
      let errors = {};
      action.errors.forEach(err, i => errors[i] = err);
      return errors;
    case RECEIVE_LOCATION:
    case RECEIVE_LOCATIONS:
      return null;
    default:
      return state;
  }
}

export default locationErrorsReducer;