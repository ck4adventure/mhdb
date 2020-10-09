import React from 'react';
import { useSelector } from 'react-redux'
import { useHistory } from 'react-router-dom';

import { makeStyles } from '@material-ui/core/styles'
import Link from '@material-ui/core/Link'

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
  const region = useSelector(state => state.regions[regionId])

  if (!Boolean(region)) {
    return <h1>Loading...</h1>
  }

  let history = useHistory();

  function handlePath(path, event) {
    event.preventDefault();
    history.push(path);
  }
  
  return (
    <div>
      <div className={classes.drawerHeader} />
      <h2>Region Page</h2>
      <h4>{region.name}</h4>
      <ul>
        {region.locations.map(loc => <li key={loc.id}><Link href={`/locations/${loc.id}`} onClick={e => handlePath(`/locations/${loc.id}`, e)}>{loc.name}</Link></li>)}
      </ul>
      
    </div>
  )
}