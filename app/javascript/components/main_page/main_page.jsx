import React from 'react';
import ItemsIndex from '../items/items_container'
import UserStatsBox from './user_stats_box'
import TabBox from './tab_box'

const MainPage = () => {
  return (
    <div className="main_page__container">
      <UserStatsBox />
      <TabBox />
      <ItemsIndex />
    </div>
  )
}
export default MainPage;