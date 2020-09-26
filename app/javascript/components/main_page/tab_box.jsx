import React from 'react'
import TrapsTable from '../items/traps_table'

const TabBox = () => {

  return (
    <div className="tab_box__container">
      <div className="tab_box__header">
        <div className="tab_box__header_item">
          Arcane
        </div>
        <div className="tab_box__header_item">
          Physical
        </div>
        <div className="tab_box__header_item">
          Rift
        </div>
      </div>
      <div className="tab_box__content">
        Table Content will Go Here
      </div>
    </div>
  )
}
export default TabBox