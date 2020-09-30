import React from 'react';
import { AppBar, Toolbar, IconButton, Typography, Button, makeStyles } from '@material-ui/core';
import MenuIcon from '@material-ui/icons/Menu';

import HeaderMenu from './header_menu';

const useStyles = makeStyles((theme) => ({
  appBar: {
    zIndex: 1300,
  },
  root: {
    flexGrow: 1,
  },
  menuButton: {
    marginRight: theme.spacing(2),
  },
  title: {
    flexGrow: 1,
  },
}));

const Header = () => {

  const classes = useStyles();

  return (
    <AppBar position="static" className={classes.appBar}>
      <Toolbar>
        <IconButton edge="start" className={classes.menuButton} color="inherit" aria-label="menu">
          <MenuIcon />
        </IconButton>
        <Typography variant="h6" className={classes.title}>
          MouseHunt Collector
        </Typography>
        <HeaderMenu />
      </Toolbar>
    </AppBar>
  );
}

export default Header;

