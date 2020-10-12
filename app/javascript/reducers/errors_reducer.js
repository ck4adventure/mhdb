import { combineReducers } from 'redux';
import sessionErrorReducer from './session_error_reducer';
import locationErrorsReducer from './location_errors_reducer';

export default combineReducers({
  session: sessionErrorReducer,
  location: locationErrorsReducer,
  // We can add as many reducers as we need here.
});