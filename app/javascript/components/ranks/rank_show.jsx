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

export default function RankShow (props) {
  const classes = useStyles();
  const rankId = props.match.params.rankId;
  const ranks = useSelector(state => state.ranks)
  let title = "";
  if (ranks && Object.keys(ranks)) {
    title = ranks[rankId].title;
  }
  
  return (
    <div>
      <div className={classes.drawerHeader} />
      <h2>Rank Page</h2>
      <p>{title}</p>
    </div>
  )
}