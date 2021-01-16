import { RECEIVE_GROUPS, RECEIVE_GROUP } from "../actions/groups_actions";

const groupsReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState = {};
  switch (action.type) {
    case RECEIVE_GROUP:
      let group = { [action.group.id]: action.group };
      return Object.assign({}, state, group);
    case RECEIVE_GROUPS:
      action.groups.forEach((group) => (nextState[group.id] = group));
      return nextState;
    default:
      return state;
  }
};

export default groupsReducer;
