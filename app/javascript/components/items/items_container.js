import { connect } from 'react-redux'

import ItemsIndex from './items_index'

//actions
import { fetchAllWeapons } from '../../actions/weapons_actions'
import { fetchAllBases } from '../../actions/bases_actions'

//selectors
import { toArray, byPowerType } from '../../reducers/selectors'

const mapStateToProps = state => ({
  arcaneWeapons: byPowerType(state.weapons, "arcane"),
  draconicWeapons: byPowerType(state.weapons, "draconic"),
  forgottenWeapons: byPowerType(state.weapons, "forgotten"),
  hydroWeapons: byPowerType(state.weapons, "hydro"),
  lawWeapons: byPowerType(state.weapons, "law"),
  parentalWeapons: byPowerType(state.weapons, "parental"),
  physicalWeapons: byPowerType(state.weapons, "physical"),
  riftWeapons: byPowerType(state.weapons, "rift"),
  shadowWeapons: byPowerType(state.weapons, "shadow"),
  tacticalWeapons: byPowerType(state.weapons, "tactical"),
  bases: toArray(state.bases),
});

const mapDispatchToProps = dispatch => ({
  requestAllWeapons: () => dispatch(fetchAllWeapons()),
  requestBases: () => dispatch(fetchAllBases()),
});

export default connect(mapStateToProps, mapDispatchToProps)(ItemsIndex);