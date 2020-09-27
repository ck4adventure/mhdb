import React from 'react'
import TrapsTable from '../items/traps_table_container'

class WeaponsTabBox extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      selectedTab: 0,
      isLoading: true,
    };
    this.selectTab = this.selectTab.bind(this);
  }

  componentDidMount(){
    this.setState({isLoading: false});
  }

  

  selectTab(num) {
    this.setState({selectedTab: num});
  }


  
  render () {
    const pane = this.props.panes[this.state.selectedTab];
    const { panes } = this.props

    const headerItems = panes.map((pane, i) =>
    <div key={i}className="tab_box__header_item">
      {pane.title}
    </div>
    ); 
    
    
    if (this.state.isLoading) {
      console.log("not yet");
      return <div>Loading...</div>
    } else {
      console.log("props exist");
      return (
        <div className="tab_box__container">
          <div className="tab_box__header">
          { headerItems }
          </div>
          <div className="tab_box__content table-container">
            <TrapsTable weaponsType={pane.power_type} />
          </div>
        </div>
      );
    }
   

  }
}
export default WeaponsTabBox