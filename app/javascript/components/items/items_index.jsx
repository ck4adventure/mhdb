import React from 'react';
import TrapsTable from './traps_table';



class ItemsIndex extends React.Component {


  componentDidMount() {
    this.props.requestAllWeapons();
    this.props.requestBases();
  }

  render() {
    let arcaneWeapons, draconicWeapons, forgottenWeapons, hydroWeapons, lawWeapons, parentalWeapons, physicalWeapons, shadowWeapons, riftWeapons, tacticalWeapons;
    let basesArr;

    if (this.props.bases[0]) {
      arcaneWeapons = this.props.arcaneWeps;
      draconicWeapons = this.props.draconicWeapons;
      forgottenWeapons = this.props.forgottenWeapons;
      hydroWeapons = this.props.hydroWeapons;
      lawWeapons = this.props.lawWeapons;
      parentalWeapons = this.props.parentalWeapons;
      physicalWeapons = this.props.physicalWeapons;
      riftWeapons = this.props.riftWeapons;
      shadowWeapons= this.props.shadowWeapons;
      tacticalWeapons = this.props.tacticalWeapons;
      basesArr = this.props.bases;
    }

    console.log(physicalWeapons);

    if (!basesArr) { 
      return <p>Loading</p>;
    }

    return (
      <div>
        <h4>Arcane Weapons</h4>
        <div className="table-container">
          <TrapsTable items={arcaneWeapons} />
        </div>
        <h4>Draconic Weapons</h4>
        <div className="table-container">
          <TrapsTable items={draconicWeapons} />
        </div>
        <h4>Forgotten Weapons</h4>
        <div className="table-container">
          <TrapsTable items={forgottenWeapons} />
        </div>
        <h4>Hydro Weapons</h4>
        <div className="table-container">
          <TrapsTable items={hydroWeapons} />
        </div>
        <h4>Law Weapons</h4>
        <div className="table-container">
          <TrapsTable items={lawWeapons} />
        </div>
        <h4>Parental Weapons</h4>
        <div className="table-container">
          <TrapsTable items={parentalWeapons} />
        </div>
        <h4>Physical Weapons</h4>
        <div className="table-container">
          <TrapsTable items={physicalWeapons} />
        </div>
        <h4>Rift Weapons</h4>
        <div className="table-container">
          <TrapsTable items={riftWeapons} />
        </div>
        <h4>Shadow Weapons</h4>
        <div className="table-container">
          <TrapsTable items={shadowWeapons} />
        </div>
        <h4>Tactical Weapons</h4>
        <div className="table-container">
          <TrapsTable items={tacticalWeapons} />
        </div>
        
        
        <h4>Bases</h4>
        <TrapsTable items={basesArr} />
      </div>
    );
  }
}

export default ItemsIndex;