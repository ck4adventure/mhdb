import React from 'react'
import TrapsTable from '../items/traps_table'

const WeaponsTabBox = (data) => {

  console.log(data.infos)
  const headerItems = data.infos.map((info, i) =>
    <div key={i}className="tab_box__header_item">
      {info.title}
    </div>
  );

  return (
    <div className="tab_box__container">
      <div className="tab_box__header">
      { headerItems }
      </div>
      <div className="tab_box__content">
        Table Content will Go Here
      </div>
    </div>
  )
}
export default WeaponsTabBox