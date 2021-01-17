import { RECEIVE_STATS } from "../actions/stats_actions";

const statsReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState = {};
  switch (action.type) {
    case RECEIVE_STATS:
      return action.stats;
    default:
      return state;
  }
};

export default statsReducer;
