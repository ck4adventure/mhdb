import React from 'react'

import Header from './header/header_container'
import MainPage from './main_page/main_page_container'
import SideNav from './side_nav/side_nav'
import Footer from './footer/footer'

const App = () => (
  <div id="page-container" className="app">
    <div id="content-wrap">
      <Header />
      <div id="content-body" className="app__main">
        <SideNav />
        <MainPage />
     </div>
     <Footer />
    </div>
  </div>
)

export default App;