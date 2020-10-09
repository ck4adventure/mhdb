import React from 'react';
import { useSelector } from 'react-redux'
import { makeStyles } from '@material-ui/core/styles'
import Link from '@material-ui/core/Link'
import { useHistory } from 'react-router-dom';

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

  let history = useHistory();

  function handlePath(path, event) {
    event.preventDefault();
    history.push(path);
  }

  if (!Boolean(location)) {
    return <h1>Loading...</h1>
  }
  
  return (
    <div>
      <div className={classes.drawerHeader} />
      <h2>Location Page</h2>
      <h4>{location.name}</h4>
      <p>The {location.name} is found within the region of <Link href={`/regions/${location.region.id}`} onClick={e => handlePath(`/regions/${location.region.id}`, e)}>{location.region.name}</Link>.</p>
      <p>The minimum Rank for this location is <Link href={`/ranks/${location.rank.id}`} onClick={e => handlePath(`/ranks/${location.rank.id}`, e)}>{location.rank.title}</Link>.</p>
      <br/>
      <br/>
      <Link href="/locations" onClick={e => handlePath("/locations",e)}>Back to Locations</Link>
    </div>
  )
}