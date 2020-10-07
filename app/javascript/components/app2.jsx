import React from 'react';
import { useDispatch, useSelector } from 'react-redux';

import {
  Route,
  Redirect,
  Switch,
  HashRouter
} from 'react-router-dom';
import { useHistory } from "react-router-dom";
import clsx from 'clsx';
import { makeStyles, useTheme } from '@material-ui/core/styles';
import Drawer from '@material-ui/core/Drawer';
import CssBaseline from '@material-ui/core/CssBaseline';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import List from '@material-ui/core/List';
import Typography from '@material-ui/core/Typography';
import Divider from '@material-ui/core/Divider';
import IconButton from '@material-ui/core/IconButton';
import MenuIcon from '@material-ui/icons/Menu';
import ChevronLeftIcon from '@material-ui/icons/ChevronLeft';
import ChevronRightIcon from '@material-ui/icons/ChevronRight';
import ListItem from '@material-ui/core/ListItem';
import ListItemIcon from '@material-ui/core/ListItemIcon';
import ListItemText from '@material-ui/core/ListItemText';
import { CardMedia, Link } from '@material-ui/core';
import InboxIcon from '@material-ui/icons/MoveToInbox';
import MailIcon from '@material-ui/icons/Mail';

import Traps from '../images/traps.png';
import Travel from '../images/travel.png';
import Mice from '../images/mice';
import Crafting from '../images/crafting';
import Collectibles from '../images/collectibles.png';
import Recruit from '../images/recruit.gif';

import AccountCircle from '@material-ui/icons/AccountCircle';
// import Switch from '@material-ui/core/Switch';
import FormControlLabel from '@material-ui/core/FormControlLabel';
import FormGroup from '@material-ui/core/FormGroup';
import MenuItem from '@material-ui/core/MenuItem';
import Menu from '@material-ui/core/Menu';

import Main from './main_page/main';
import SignIn from './session/sign_in';
import SignUp from './session/sign_up';
import Profile from './profile/profile';

import { signup, login, logout } from '../actions/session_actions';
const drawerWidth = 240;

const useStyles = makeStyles((theme) => ({
  root: {
    display: 'flex',
    flexGrow: 1,
  },
  appBar: {
    transition: theme.transitions.create(['margin', 'width'], {
      easing: theme.transitions.easing.sharp,
      duration: theme.transitions.duration.leavingScreen,
    }),
  },
  appBarShift: {
    width: `calc(100% - ${drawerWidth}px)`,
    marginLeft: drawerWidth,
    transition: theme.transitions.create(['margin', 'width'], {
      easing: theme.transitions.easing.easeOut,
      duration: theme.transitions.duration.enteringScreen,
    }),
  },
  menuButton: {
    marginRight: theme.spacing(2),
  },
  title: {
    flexGrow: 1,
  },
  hide: {
    display: 'none',
  },
  drawer: {
    width: drawerWidth,
    flexShrink: 0,
  },
  drawerPaper: {
    width: drawerWidth,
  },
  drawerHeader: {
    display: 'flex',
    alignItems: 'center',
    padding: theme.spacing(0, 1),
    // necessary for content to be below app bar
    ...theme.mixins.toolbar,
    justifyContent: 'space-between',
    paddingLeft: 16,
  },
  content: {
    flexGrow: 1,
    padding: theme.spacing(3),
    transition: theme.transitions.create('margin', {
      easing: theme.transitions.easing.sharp,
      duration: theme.transitions.duration.leavingScreen,
    }),
    marginLeft: -drawerWidth,
    display: 'flex',
    justifyContent: 'center',
  },
  contentShift: {
    transition: theme.transitions.create('margin', {
      easing: theme.transitions.easing.easeOut,
      duration: theme.transitions.duration.enteringScreen,
    }),
    marginLeft: 0,
  },
  icon: {
    height: 18,
    width: 18,
  }
}));

export default function App() {
  const classes = useStyles();
  const theme = useTheme();
  const [open, setOpen] = React.useState(false);

  const auth = useSelector(state => state.session.id);
  const [anchorEl, setAnchorEl] = React.useState(null);
  const menuOpen = Boolean(anchorEl);

  let history = useHistory();
  const dispatch = useDispatch();


  // mine
  const handleChange = (event) => {
    setAuth(event.target.checked);
  };

  const handleMenu = (event) => {
    setAnchorEl(event.currentTarget);
  };

  const handleClose = (path, event) => {
    setAnchorEl(null);
    handlePath(path);
  };

  const handleLogout = () => {
    // close window
    setAnchorEl(null);
    // dispatch logout
    dispatch(logout());
  };

  const handleDrawerOpen = () => {
    setOpen(true);
  };

  const handleDrawerClose = () => {
    setOpen(false);
  };
  const handleHome = (event) => {
    event.preventDefault();
    history.push('/');
  }
  const handlePath = (path, event) => {
    event.preventDefault();
    history.push(path);
  }

  const list1Items = [{name: "Traps", img: Traps}, {name: "Locations", img: Travel }, {name: "Mice", img: Mice }].map((el, index) => (
    <ListItem button key={el.name}>
      <ListItemIcon>
      <CardMedia        
            className={classes.icon}
            image={el.img}
            title={el.name}
        />
      </ListItemIcon>
      <ListItemText primary={el.name} />
    </ListItem>
  ));

  const list2Items = [{name: "Crafting", img: Crafting}, {name: "Collectibles", img: Collectibles }, {name: "Ranks", img: Recruit }].map((el, index) => (
    <ListItem button key={el.name}>
      <ListItemIcon>
      <CardMedia        
            className={classes.icon}
            image={el.img}
            title={el.name}
        />
      </ListItemIcon>
      <ListItemText primary={el.name} />
    </ListItem>
  ));

  return (
    <div className={classes.root}>
      <CssBaseline />
      <AppBar
        position="fixed"
        className={clsx(classes.appBar, {
          [classes.appBarShift]: open,
        })}
      >
        <Toolbar>
          <IconButton
            color="inherit"
            aria-label="open drawer"
            onClick={handleDrawerOpen}
            edge="start"
            className={clsx(classes.menuButton, open && classes.hide)}
          >
            <MenuIcon />
          </IconButton>
          <Typography className={classes.title} variant="h6" noWrap>
            <Link href="/" onClick={handleHome} color="inherit" underline="none">
              MouseHuntCollector
            </Link>
          </Typography>
          {auth && (
            <div>
              <IconButton
                edge="end"
                aria-label="account of current user"
                aria-controls="menu-appbar"
                aria-haspopup="true"
                onClick={handleMenu}
                color="inherit"
              >
                <AccountCircle />
              </IconButton>
              <Menu
                id="menu-appbar"
                anchorEl={anchorEl}
                anchorOrigin={{
                  vertical: 'top',
                  horizontal: 'right',
                }}
                keepMounted
                transformOrigin={{
                  vertical: 'top',
                  horizontal: 'right',
                }}
                open={menuOpen}
                onClose={handleClose}
              >
                <MenuItem onClick={e => handleClose("/profile", e)}>Profile</MenuItem>
                <MenuItem onClick={handleLogout}>Log Out</MenuItem>
              </Menu>
            </div>
          )}
          { !auth && (
            <Link href="/login" onClick={e => handlePath('/login', e)} underline="none">
              Login
            </Link>
          )}
        </Toolbar>
      </AppBar>
      <Drawer
        className={classes.drawer}
        variant="persistent"
        anchor="left"
        open={open}
        classes={{
          paper: classes.drawerPaper,
        }}
      >
        <div className={classes.drawerHeader}>
          <Typography>
            Quick Links
          </Typography>
          <IconButton onClick={handleDrawerClose}>
            {theme.direction === 'ltr' ? <ChevronLeftIcon /> : <ChevronRightIcon />}
          </IconButton>
        </div>
        <Divider />
        <List>
          {list1Items}
        </List>
        <Divider />
        <List>
          {list2Items}
        </List>
      </Drawer>
      <main
        className={clsx(classes.content, {
          [classes.contentShift]: open,
        })}
      >
        <Switch>
          <Route path="/signup" component={SignUp} />
          <Route path="/login" component={SignIn} />
          <Route path="/profile" component={Profile} />
          <Route path="/" component={Main} />
        </Switch>
      </main>
    </div>
  );
}
