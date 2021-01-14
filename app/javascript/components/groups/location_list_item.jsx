import React from 'react';
import { useSelector } from 'react-redux';
import { useHistory } from "react-router-dom";

import { makeStyles } from '@material-ui/core/styles';
import ListItem from '@material-ui/core/ListItem';
import ListItemText from '@material-ui/core/ListItemText';

const useStyles = makeStyles((theme) => ({
  location_list: {
    display: "flex",
    flexDirection: "row",
  },
  root: {
      width: 'inherit',
  },
  location_text: {
    color: "indigo",
    marginRight: 16,
  },
}))

function createData(locId, locName) {
  return { locId, locName }
}

export default function Location_List_Item (props) {
  const { locId } = props;
  
  const classes = useStyles();
  let history = useHistory();

  function handlePath(path, event) {
    event.preventDefault();
    history.push(path);
  }

  const loc = useSelector(state => state.locations[locId]);
  if (!Boolean(loc)) {
    return <p>Loading...</p>
  }

  return (
    <ListItem 
      key={loc.id} 
      button onClick={e => handlePath(`/locations/${loc.id}`, e)} 
      className={classes.root} 
      disableGutters
      >
      <ListItemText primary={loc.name} className={classes.location_text} disableTypography />
    </ListItem>
  );
}