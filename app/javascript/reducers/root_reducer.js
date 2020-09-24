import { combineReducers } from 'redux'
import weaponsReducer from './weapons_reducer';
import itemsReducer from './items_reducer';
import basesReducer from './bases_reducer';

const rootReducer = combineReducers({
  weapons: weaponsReducer,
  items: itemsReducer,
  bases: basesReducer,
});

export default rootReducer;