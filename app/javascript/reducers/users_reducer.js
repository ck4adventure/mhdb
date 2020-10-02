import { RECEIVE_CURRENT_USER } from '../actions/session_actions';

// const initialUsers = {
//   1: {
//     id: 1,
//     name: "Larry",
//     rank_id: 4,
//     title: "Knight",
//   },

// }

export default (state = {}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      return Object.assign({}, state,  {[action.currentUser.id]: action.currentUser });
    default:
      return state;
  }
}