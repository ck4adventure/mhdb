import React from 'react';

import TrapsTableRow from './traps_table_row';

class TrapsTable extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      isLoading: true
    }
  }


  componentDidUpdate(prevProps){
    if(this.props.weapons !== prevProps.weapons) {
      this.setState({isLoading: false})
    }
  }

  
  render() {
    const { weapons } = this.props;
    
    if (!this.state.isLoading) {
      const trapsTableRows = weapons.map(item => (
        <TrapsTableRow 
          key={item.id}
          item={item} />
        )
      );

      return (
        <table>
          <thead>
            <tr><th>Name</th><th>Power</th><th>Power Bonus</th><th>Attr Bonus</th><th>Luck</th><th>Cheese Effect</th></tr>
          </thead>
          <tbody>
            { trapsTableRows }
          </tbody>
        </table>
      );
    } else {
      return <div>Nothin yet</div>;
    }
  }
}

export default TrapsTable;