import { connect } from 'react-redux'

import ItemsIndex from './items_index'

//actions
import { fetchWeapons } from '../../actions/weapons_actions'

//selectors
import { toArray } from '../../reducers/selectors'

const mapStateToProps = state => ({
  weapons: toArray(state.weapons),
});

const mapDispatchToProps = dispatch => ({
  requestWeapons: () => dispatch(fetchWeapons()),
});

export default connect(mapStateToProps, mapDispatchToProps)(ItemsIndex);