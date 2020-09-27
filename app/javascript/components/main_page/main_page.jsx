import React from 'react';
import ItemsIndex from '../items/items_container'
import UserStatsBox from './user_stats_box'
import WeaponsTabBox from './weapons_tab_box_container'

class MainPage extends React.Component {
  componentDidMount() {
    this.props.requestAllWeapons();
    this.props.requestAllBases();
  }

  render() {
    const content = [{ title: "Physical", power_type: "physical" },{ title: "Arcane", power_type: "arcane" },{ title: "Rift", power_type: "rift" },];

    return (
      <div className="main_page__container">
        <UserStatsBox />
        <WeaponsTabBox panes={content} />
      </div>
    );
  }
}
export default MainPage;