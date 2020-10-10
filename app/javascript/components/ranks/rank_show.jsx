import React from 'react';
import { useSelector } from 'react-redux'
import { useHistory } from "react-router-dom";
import { makeStyles } from '@material-ui/core/styles'
import Link from '@material-ui/core/Link';
import CardMedia from '@material-ui/core/CardMedia';
import Container from '@material-ui/core/Container';
import Typography from '@material-ui/core/Typography';

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
  const ipath = './' + rank.title.split(" ").join("").toLowerCase();

  return (
    <div>
      <div className={classes.drawerHeader} />
      <Container className={classes.titleContainer}>
        <CardMedia        
                          className={classes.media}
                          image={imagePath(ipath)}
                          title={rank.title}
                      />
        <Typography variant="h3" className={classes.title}>{rank.title}</Typography>

      </Container>

      <h4>Locations unlocked:</h4>
      <ul>
        {rank.locations.map(loc => <li key={loc.id}><Link href={`/locations/${loc.id}`} onClick={e => handlePath(`/locations/${loc.id}`, e)}>{loc.name}</Link></li>)}
      </ul>
      <br/>
      <br/>
      <Link href="/ranks" onClick={e => handlePath("/ranks",e)}>Back to Ranks</Link>
    </div>
  )
}