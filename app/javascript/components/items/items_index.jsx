import React from 'react'

class ItemsIndex extends React.Component {
  componentDidMount() {
    this.props.requestWeapons();
  }

  render() {
    let weaponsArr;
    let basesArr;

    if (this.props.weapons[0]) {
      weaponsArr = this.props.weapons;
      basesArr = this.props.bases;
      console.log("Bam!")
      console.log(weaponsArr);
    }

    if (!weaponsArr) { 
      return <p>Loading</p>;
    }

    return (
      <div>
        <h4>Weapons</h4>
        <ul>
          { weaponsArr.map(el => <li>{el.name}</li>) }
        </ul>
        <h4>Bases</h4>
        <ul>
          { basesArr.map(el => <li>{el.name}</li>) }
        </ul>
      </div>
    );
  }
}

export default ItemsIndex;