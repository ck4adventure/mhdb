import { RECEIVE_MICE, RECEIVE_MOUSE } from "../actions/mice_actions";

const miceReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState = {};
  switch (action.type) {
    case RECEIVE_MOUSE:
      let mouse = { [action.mouse.id]: action.mouse };
      console.log(mouse);
      return Object.assign({}, state, mouse);
    case RECEIVE_MICE:
      action.mice.forEach((mouse) => (nextState[mouse.id] = mouse));
      return nextState;
    default:
      return state;
  }
};

export default miceReducer;
