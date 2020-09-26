import React from 'react';
import ItemsIndex from '../items/items_container'
import UserStatsBox from './user_stats_box'
import TabBox from './tab_box'

class MainPage extends React.Component {
  render () {
    return (
      <div className="main_page__container">
        <UserStatsBox />
        <TabBox />
      </div>
    );
  }
}
export default MainPage;