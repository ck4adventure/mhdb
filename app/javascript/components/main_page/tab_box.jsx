import React from 'react'

const TabBox = () => {

  return (
    <div className="tab_box__container">
      <div className="tab_box__header">
        <div className="tab_box__header_item">
          Header1
        </div>
        <div className="tab_box__header_item">
          Header2
        </div>
        <div className="tab_box__header_item">
          Header3
        </div>
      </div>
      <div className="tab_box__content">
        Table Content will Go Here
      </div>
    </div>
  )
}
export default TabBox