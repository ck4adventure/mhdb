import { RECEIVE_ITEMS, RECEIVE_ITEM } from '../actions/items_actions'

const itemsReducer = (state = {}, action) => {
  Object.freeze(state)
  let nextState = {}
  switch (action.type) {
    case RECEIVE_ITEM:
      nextState[action.item.id] = item;
      return Object.assign({}, state, nextState);
    case RECEIVE_ITEMS:
      action.items.forEach(item => nextState[item.id] = item)
      return nextState;
    default:
      return state;
  }
}

export default itemsReducer;