import React from 'react';

const UserStatsBox = () => {
  return (
    <div className="userstats__container">
      <div className="userstats__greeting">
        <div>Welcome, Huntress</div>
        <div>Current Rank: Grandmaster</div>
      </div>
      <div className="userstats__section-header">
        <div>Trap Collection</div>
      </div>
      <div className="userstats__weapons-stats">
          <div className="userstats__item-box" >
            <div>Arcane</div>
            <div>13/15</div>
          </div>
          <div className="userstats__item-box" >
            <div>Draconic</div>
            <div>13/15</div>
          </div> 
          <div className="userstats__item-box" >
            <div>Forgotten</div>
            <div>13/15</div>
          </div>         
          <div className="userstats__item-box" >
            <div>Hydro</div>
            <div>13/15</div>
          </div>
          <div className="userstats__item-box" >
            <div>Law</div>
            <div>13/15</div>
          </div>
          <div className="userstats__item-box" >
            <div>Parental</div>
            <div>13/15</div>
          </div>
          <div className="userstats__item-box" >
            <div>Physical</div>
            <div>13/15</div>
          </div>
          <div className="userstats__item-box" >
            <div>Rift</div>
            <div>13/15</div>
          </div>
          <div className="userstats__item-box" >
            <div>Tactical</div>
            <div>13/15</div>
          </div>
          <div className="userstats__item-box" >
            <div>Shadow</div>
            <div>13/15</div>
          </div>
          <div className="userstats__item-box" >
            <div>Bases</div>
            <div>100/155</div>
          </div>

      </div>
    </div>
  )
}

export default UserStatsBox;