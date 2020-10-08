import { combineReducers } from 'redux'
import itemsReducer from './items_reducer';
import errorsReducer from './errors_reducer';
import sessionReducer from './session_reducer';
import usersReducer from './users_reducer';
import uiReducer from './ui_reducer';
import ranksReducer from './ranks_reducer';

const rootReducer = combineReducers({
  session: sessionReducer,
  users: usersReducer,
  ranks: ranksReducer,
  items: itemsReducer,
  errors: errorsReducer,
  ui: uiReducer,
});

export default rootReducer;