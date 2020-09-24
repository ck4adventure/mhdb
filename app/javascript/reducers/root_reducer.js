import { combineReducers } from 'redux'
import weaponsReducer from '../reducers/weapons_reducer'
import itemsReducer from './items_reducer';

const rootReducer = combineReducers({
  weapons: weaponsReducer,
  items: itemsReducer,
});

export default rootReducer;