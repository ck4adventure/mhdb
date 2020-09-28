import React from 'react';

const UserStatsBox = () => {
  return (
    <div className="userstats__container">
      <div className="userstats__greeting">
        <div>Welcome, Huntress</div>
        <div>Current Rank: Grandmaster</div>
      </div>
      <div className="userstats__weapons_stats_container">
        <div className="userstats__weapons-stats-box">
            <div className="userstats__item-box" >
              <div>13/15</div>
              <div>Arcane</div>
            </div>
            <div className="userstats__item-box" >
              <div>13/15</div>
              <div>Draconic</div>
            </div> 
            <div className="userstats__item-box" >
              <div>13/15</div>
              <div>Forgotten</div>
            </div>         
            <div className="userstats__item-box" >
              <div>13/15</div>
              <div>Hydro</div>
            </div>
            <div className="userstats__item-box" >
            <div>13/15</div>
              <div>Law</div>
            </div>
            <div className="userstats__item-box" >
              <div>13/15</div>
              <div>Parental</div>
            </div>
            <div className="userstats__item-box" >
              <div>13/15</div>
              <div>Physical</div>
            </div>
            <div className="userstats__item-box" >
              <div>13/15</div>
              <div>Rift</div>
            </div>
            <div className="userstats__item-box" >
              <div>13/15</div>
              <div>Tactical</div>
            </div>
            <div className="userstats__item-box" >
              <div>13/15</div>
              <div>Shadow</div>
            </div>
          </div>
          <div className="userstats__weapons-stats-box">
            <div className="userstats__item-box" >
              <div>Bases</div>
              <div>100/155</div>
            </div>
        </div>
      </div>
    </div>
  )
}

export default UserStatsBox;