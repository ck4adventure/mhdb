import { connect } from 'react-redux';

import { fetchAllWeapons } from '../../actions/weapons_actions'
import { fetchAllBases } from '../../actions/bases_actions'

import TrapsTable from './traps_table';
import { toArray } from '../../reducers/selectors';

const mapStateToProps = (state, ownProps) => {
  const weps = state.weapons[ownProps.weaponsType];
  return {
    weapons: toArray(weps),
  };
};

const mapDispatchToProps = (dispatch, ownProps) => {
  return {
    requestAllWeapons: () => { dispatch(fetchAllWeapons()); },
    requestAllBases: () => {
      dispatch(fetchAllBases());
    }
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(TrapsTable);