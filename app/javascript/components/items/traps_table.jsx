import React from 'react';

import TrapsTableRow from './traps_table_row';

class TrapsTable extends React.Component {
  render() {
    const { items } = this.props;

    if (!items || items.length < 1) {
      return <div>No weapons added yet.</div>
    }

    const trapsTableRows = items.map(item => (
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
  }
}

export default TrapsTable;