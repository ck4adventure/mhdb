import React from 'react';
import ItemsIndex from '../items/items_container'
import UserStatsBox from './user_stats_box'
import WeaponsTabBox from './weapons_tab_box'

class MainPage extends React.Component {

  render() {
    const content = [{ title: "Arcane", power_type: "arcane" },{ title: "Physical", power_type: "physical" },{ title: "Rift", power_type: "rift" },];

    return (
      <div className="main_page__container">
        <UserStatsBox />
        <WeaponsTabBox infos={content} />
      </div>
    );
  }
}
export default MainPage;