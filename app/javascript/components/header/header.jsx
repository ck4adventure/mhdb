import React from 'react'

class Header extends React.Component {
  render(){
    return (
      <div className="header__container"> 
        <div className="header__container--left">
          <div className="header wordmark">
            MouseHunt Collector
          </div>
        </div>
        <div className="header__container--right">
          <div className="header user-info">
            ck4adventure
          </div>
          <div className="header session-container">
            Sign Out
          </div>
        </div>

      </div>
    );
  }
}

export default Header;

