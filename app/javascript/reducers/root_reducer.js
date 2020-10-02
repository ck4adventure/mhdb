import { combineReducers } from 'redux'
import itemsReducer from './items_reducer';
import errorsReducer from './errors_reducer';
import sessionReducer from './session_reducer';
import usersReducer from './users_reducer';

const rootReducer = combineReducers({
  session: sessionReducer,
  users: usersReducer,
  items: itemsReducer,
  errors: errorsReducer,
});

export default rootReducer;