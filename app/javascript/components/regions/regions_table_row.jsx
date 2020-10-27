import React from 'react';
import { useSelector } from 'react-redux';
import { useHistory } from "react-router-dom";

import { makeStyles } from '@material-ui/core/styles';

import TableCell from '@material-ui/core/TableCell';
import TableRow from '@material-ui/core/TableRow';
import Link from '@material-ui/core/Link';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import ListItemText from '@material-ui/core/ListItemText';
import LocationListItem from './location_list_item';

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

export default function RegionsTableRow (props) {
  // regId
  const { regId } = props;
  
  const classes = useStyles();
  let history = useHistory();

  const region = useSelector(state => state.regions[regId]);
  const locsArr2 = useSelector(state => state.regions[regId].locations)

  
  let locsArr = [];
  
  // region.locations = [{id:1}, {id:2}]
  if (region.locations && region.locations.length > 0) {
    locsArr = region.locations.map(kp => kp.id);
  }

  const handlePath = (path, e) => {
    e.preventDefault();
    history.push(path);
  }

  return (
    <TableRow key={region.id}>
      <TableCell component="th" scope="row">
        <Link href={`/regions/${region.id}`} onClick={e => handlePath(`/regions/${region.id}`, e)} underline="none">
          {region.name}
        </Link>
      </TableCell>
      <TableCell>
        <List className={classes.location_list}>
          {locsArr && locsArr.map(loc => <LocationListItem key={loc} locId={loc}/>)}
        </List>
      </TableCell>
    </TableRow>
  );
}