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

export default function RegionShow (props) {
  const classes = useStyles();
  const regionId = props.match.params.regionId;
  const regions = useSelector(state => state.regions)
  let name = "";
  if (regions && Object.keys(regions)) {
    name = regions[regionId].name;
  }
  
  return (
    <div>
      <div className={classes.drawerHeader} />
      <h2>Region Page</h2>
      <p>{name}</p>
    </div>
  )
}