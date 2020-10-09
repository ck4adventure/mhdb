import React from 'react';
import { useSelector } from 'react-redux'
import { makeStyles } from '@material-ui/core/styles'

const useStyles = makeStyles((theme) => ({
  drawerHeader: {
    display: 'flex',
    alignItems: 'center',
    padding: theme.spacing(0, 1),
    // necessary for content to be below app bar
    ...theme.mixins.toolbar,
    alignContent: 'flex-end',
  },
}));

export default function LocationShow (props) {
  const classes = useStyles();
  const locationId = props.match.params.locationId;
  const location = useSelector(state => state.locations[locationId])
  let name = "";
  if (location && Object.keys(location)) {
    name = location.name;
  }
  
  return (
    <div>
      <div className={classes.drawerHeader} />
      <h2>Location Page</h2>
      <p>{name}</p>
    </div>
  )
}