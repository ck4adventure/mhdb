import React from 'react';
import { useSelector } from 'react-redux'
import { useHistory } from "react-router-dom";
import { makeStyles } from '@material-ui/core/styles'
import Link from '@material-ui/core/Link';
import CardMedia from '@material-ui/core/CardMedia';
import Container from '@material-ui/core/Container';
import Typography from '@material-ui/core/Typography';

import { List, ListItem, ListItemLink, ListItemText } from '@material-ui/core';

import NameCard from '../cards/name_card';

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
    marginBottom: 16,
  },
  title: {
    marginLeft: 20,
  },
  media: {
    height: 50,
    width: 50,
  },
}));

export default function RankShow (props) {
  const classes = useStyles();
  const rankId = props.match.params.rankId;
  const rank = useSelector(state => state.ranks[rankId])
  let history = useHistory();

  if (!Boolean(rank)) {
    return <h1>Loading...</h1>
  }
  const handlePath = (path, e) => {
    e.preventDefault();
    history.push(path);
  }

  return (
    <div>
      <div className={classes.drawerHeader} />
      <Container className={classes.titleContainer}>
        {rank.image && <CardMedia        
                          className={classes.media}
                          image={rank.image}
                          title={rank.title}
        /> }
        <Typography variant="h3" className={classes.title}>{rank.title}</Typography>

      </Container>

      <Typography variant="h6">Locations unlocked:</Typography>
      <List>
        {rank.locations.map(loc => (
          <ListItem key={loc.id} >
            <NameCard name={loc.name} path={`/locations/${loc.id}`} image={loc.image} />
          </ListItem>
        ))}
      </List>
      <br/>
      <br/>
      <Link href="/ranks" onClick={e => handlePath("/ranks",e)}>Back to Ranks</Link>
    </div>
  )
}