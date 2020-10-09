import { RECEIVE_RANKS } from '../actions/ranks_actions';

const ranksReducer = (state = {}, action) => {
  Object.freeze(state)
  let nextState = {}
  switch (action.type) {
    case RECEIVE_RANKS:
      action.ranks.forEach(rank => nextState[rank.id] = rank);
      return nextState;
    default:
      return state;
  }
}

export default ranksReducer;