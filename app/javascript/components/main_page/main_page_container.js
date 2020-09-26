import { connect } from 'react-redux';

import * as ItemsApiUtil from '../../util/items_api'
import { byPowerType } from '../../reducers/selectors';
import { fetchAllWeapons }from '../../actions/weapons_actions';

import MainPage from './main_page'

const mapStateToProps = (state, ownProps) => ({
  tableWeapons: byPowerType(state.weapons, "physical"),
});

const mapDispatchToProps = (dispatch, ownProps) => {
  return {
    requestAllWeapons: () => {
      dispatch(fetchAllWeapons());
    }
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(MainPage)