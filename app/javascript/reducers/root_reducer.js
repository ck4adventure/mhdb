import { combineReducers } from "redux";
import itemsReducer from "./items_reducer";
import errorsReducer from "./errors_reducer";
import sessionReducer from "./session_reducer";
import usersReducer from "./users_reducer";
import uiReducer from "./ui_reducer";
import ranksReducer from "./ranks_reducer";
import regionsReducer from "./regions_reducer";
import locationsReducer from "./locations_reducer";
import groupsReducer from "./groups_reducer";

const rootReducer = combineReducers({
  session: sessionReducer,
  users: usersReducer,
  ranks: ranksReducer,
  groups: groupsReducer,
  regions: regionsReducer,
  locations: locationsReducer,
  items: itemsReducer,
  errors: errorsReducer,
  ui: uiReducer,
});

export default rootReducer;
