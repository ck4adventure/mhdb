import React from 'react';

class TrapsTableRow extends React.Component {
  render() {
    const { item } = this.props
    return (
      <tr>
        <td>{item.name}</td>
        <td>{item.power}</td>
        <td>{item.p_bonus}</td>
        <td>{item.attr_bonus}</td>
        <td>{item.luck}</td>
        <td>{item.cheese_effect}</td>
      </tr>
    );
  }
}

export default TrapsTableRow;