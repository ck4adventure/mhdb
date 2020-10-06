import { combineReducers } from 'redux';
import weaponsReducer from './weapons_reducer';
import basesReducer from './bases_reducer';


export default combineReducers({
  weapons: weaponsReducer,
  bases: basesReducer,
});