import { connect } from 'react-redux';

import Header from './header';
import { receiveDrawerOpen, receiveDrawerClosed } from '../../actions/ui_actions';
mapStateToProps = (state, ownProps) => {
  return {
    drawerOpen: this.state.ui.drawerOpen,
    user: { id: 1 },
  }
}

const mapDispatchToProps = (dispatch, ownProps) => {
  return {
    sendDrawerOpen: () => {
      dispatch(receiveDrawerOpen);
    },
    sendDrawerClosed: () => {
      dispatch(receiveDrawerClosed);
    }
  };
};
  
  
  
  
export default connect(mapStateToProps, mapDispatchToProps, mergeProps)(Header);