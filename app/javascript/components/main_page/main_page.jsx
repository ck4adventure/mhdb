import React from 'react';
import ItemsIndex from '../items/items_container'

const MainPage = () => {
  return (
    <div className="main_page__container">
      <div className="userstats__container">
        <h4>Welcome, Huntress</h4>
        <div>Stats are coming soon.</div>
      </div>
      <ItemsIndex />
    </div>
  )
}
export default MainPage;