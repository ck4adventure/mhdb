import React from 'react'

class ItemsIndex extends React.Component {
  componentDidMount() {
    this.props.requestWeapons();
  }

  render() {
    const { weapons } = this.props;

    if (!weapons) { return <p>"Loading..."</p>; }
    
    return (
      <div>
        <h4>Weapons</h4>
        <ul>
          { this.props.weapons.forEach(wep => { <li>{wep.name}</li> }) }
        </ul>
      </div>
    );
  }
}

export default ItemsIndex;