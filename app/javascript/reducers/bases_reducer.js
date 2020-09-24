import { RECEIVE_BASES, RECEIVE_BASE } from '../actions/bases_actions'

const basesReducer = (state = {}, action) => {
  Object.freeze(state)
  let nextState = {}
  switch (action.type) {
    case RECEIVE_BASE:
      nextState[action.base.id] = base;
      return Object.assign({}, state, nextState);
    case RECEIVE_BASES:
      action.bases.forEach(base => nextState[base.id] = base)
      return nextState;
    default:
      return state;
  }
}

export default basesReducer;