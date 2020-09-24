import { connect } from 'react-redux'

import ItemsIndex from './items_index'

//actions
import { fetchWeapons } from '../../actions/weapons_actions'
import { fetchBases } from '../../actions/bases_actions'

//selectors
import { toArray } from '../../reducers/selectors'

const mapStateToProps = state => ({
  weapons: toArray(state.weapons),
  bases: toArray(state.bases),
});

const mapDispatchToProps = dispatch => ({
  requestWeapons: () => dispatch(fetchWeapons()),
  requestBases: () => dispatch(fetchBases()),
});

export default connect(mapStateToProps, mapDispatchToProps)(ItemsIndex);