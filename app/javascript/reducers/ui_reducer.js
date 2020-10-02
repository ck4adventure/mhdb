import { RECEIVE_DRAWER_OPEN, RECEIVE_DRAWER_CLOSED } from '../actions/ui_actions';

closed = {
  drawerOpen: false,
};

export default = (state = closed, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_DRAWER_OPEN:
      return Object.assign({}, { drawerOpen: true })
    case RECEIVE_DRAWER_CLOSED:
      return Object.assign({}, { drawerOpen: false })
    default:
      return state;
  }
}