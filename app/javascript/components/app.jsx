import React from 'react';
import CssBaseline from '@material-ui/core/CssBaseline';
import CustomAppBar from './header/custom_app_bar';
import CustomDrawer from './side_nav/custom_drawer';

export default function App() {
  return (
    <div className="appl">
      <CssBaseline />
      <CustomAppBar />
      <CustomDrawer />
    </div>

  );
}