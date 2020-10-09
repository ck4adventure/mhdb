import React from 'react';
import { useSelector } from 'react-redux'
import { useHistory } from "react-router-dom";
import { makeStyles } from '@material-ui/core/styles'
import Link from '@material-ui/core/Link';

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
      <h2>Rank Page</h2>
      <h4>{rank.title}</h4>
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