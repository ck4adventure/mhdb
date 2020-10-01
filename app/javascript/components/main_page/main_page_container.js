import { connect } from 'react-redux';

import { fetchAllWeapons }from '../../actions/weapons_actions';
import { fetchAllBases }from '../../actions/bases_actions';

import MainPage from './main_page'

const mapStateToProps = (state, ownProps) => ({
  ptypes: Object.keys(state.weapons),
});

const mapDispatchToProps = (dispatch, ownProps) => {
  return {
    requestAllWeapons: () => { dispatch(fetchAllWeapons()); },
    requestAllBases: () => {
      dispatch(fetchAllBases());
    }
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(MainPage)