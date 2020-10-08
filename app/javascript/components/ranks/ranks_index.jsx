import React, { useEffect } from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { useHistory } from "react-router-dom";

import { makeStyles, useTheme } from '@material-ui/core/styles';
import Link from '@material-ui/core/Link';
import { toArray } from '../../reducers/selectors';

const useStyles = makeStyles((theme) => ({
  drawerHeader: {
    display: 'flex',
    alignItems: 'center',
    padding: theme.spacing(0, 1),
    // necessary for content to be below app bar
    ...theme.mixins.toolbar,
    alignContent: 'flex-end',
  },
}))
export default function RanksPage () {
  const r = useSelector(state => state.ranks);
  const classes = useStyles();
  let history = useHistory();

  const handlePath = (path, e) => {
    e.preventDefault();
    history.push(path);
  }
  
  const rarr = Object.keys(r).map(id => {
    const rank = r[id];
    return (
      <li key={id}>
        <Link href={`/ranks/${id}`} onClick={e => handlePath(`/ranks/${id}`, e)} underline="none">
          {rank.title}
        </Link>
      </li>
    )
  });
  if (rarr.length == 0) {
    return <h1>Loading</h1>
  }
  
  return (
    <div>
      <div className={classes.drawerHeader} />
        <h4>Ranks</h4>
        <ul>
          {rarr}
        </ul>
    </div>
  )
}
