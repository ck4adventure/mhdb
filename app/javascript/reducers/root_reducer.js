import { combineReducers } from 'redux'
import itemsReducer from '../reducers/items_reducer'

const rootReducer = combineReducers({
  items: itemsReducer,
});

export default rootReducer;