import React, { useEffect } from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { makeStyles, useTheme } from '@material-ui/core/styles';

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

  
  const rarr = Object.keys(r).map(id => <li key={id}>{r[id].title}</li>);
  if (rarr.length == 0) {
    return <h1>Ranks</h1>
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
