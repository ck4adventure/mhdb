import React from 'react';
import { useSelector } from 'react-redux'
import { useHistory } from 'react-router-dom';

import { makeStyles } from '@material-ui/core/styles';
import Container from '@material-ui/core/Container';
import CardMedia from '@material-ui/core/CardMedia';
import Typography from '@material-ui/core/Typography';
import Link from '@material-ui/core/Link';

import EditLocationModal from './edit_location_modal';

const images = require.context('../../images', true)
const imagePath = (name) => images(name, true);

const useStyles = makeStyles((theme) => ({
  drawerHeader: {
    display: 'flex',
    alignItems: 'center',
    padding: theme.spacing(0, 1),
    // necessary for content to be below app bar
    ...theme.mixins.toolbar,
    alignContent: 'flex-end',
  },
  titleContainer: {
    display: 'flex',
    alignItems: 'center',
  },
  media: {
    height: 38,
    width: 38,
    borderRadius: 3,
  },
  title: {
   padding: 0,
   paddingLeft: 5,
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
      <Container className={classes.titleContainer}>
        {location.image && <CardMedia        
            className={classes.media}
            image={`http://localhost:3000${location.image}`}
            title={location.name}
        />}
        <Typography variant="h4" className={classes.title}>{location.name}</Typography>

      </Container>
      <p>The {location.name} is found within the region of <Link href={`/regions/${location.region.id}`} onClick={e => handlePath(`/regions/${location.region.id}`, e)}>{location.region.name}</Link>.</p>
      <p>The minimum Rank for this location is <Link href={`/ranks/${location.rank.id}`} onClick={e => handlePath(`/ranks/${location.rank.id}`, e)}>{location.rank.title}</Link>.</p>
      <br/>
      <br/>
      <Link href="/locations" onClick={e => handlePath("/locations",e)}>Back to Locations</Link>
      <EditLocationModal locationId={location.id} />
    </div>
  )
}