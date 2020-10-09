import React, { useEffect } from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { useHistory } from "react-router-dom";

import { makeStyles, useTheme } from '@material-ui/core/styles';
import Link from '@material-ui/core/Link';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableContainer from '@material-ui/core/TableContainer';
import TableHead from '@material-ui/core/TableHead';
import TableRow from '@material-ui/core/TableRow';
import Paper from '@material-ui/core/Paper';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';

import { toArray } from '../../reducers/selectors';
import { ListItemText } from '@material-ui/core';

const useStyles = makeStyles((theme) => ({
  drawerHeader: {
    display: 'flex',
    alignItems: 'center',
    padding: theme.spacing(0, 1),
    // necessary for content to be below app bar
    ...theme.mixins.toolbar,
    alignContent: 'flex-end',
  },
  table: {
    minWidth: 800,
  },
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

function createData(name, id, path, locations) {
  return { name, id, path, locations }
}
export default function RegionsPage () {
  const r = useSelector(state => state.regions);
  const locs = useSelector(state => state.locations);
  const classes = useStyles();
  let history = useHistory();

  const handlePath = (path, e) => {
    e.preventDefault();
    history.push(path);
  }
  
  const rows = Object.keys(r).map(id => createData(r[id].name, id, `/regions/${id}`, r[id].locations));

  if (Object.keys(locs).length < 1) {
    return <h1>Loading</h1>
  }
  
  return (
    <div>
      <div className={classes.drawerHeader} />
        <h2>All the Regions</h2>
        <TableContainer component={Paper}>
          <Table className={classes.table} aria-label="simple table">
            <TableHead>
              <TableRow>
                <TableCell>Name</TableCell>
                <TableCell>Locations</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {rows.map((row) => (
                <TableRow key={row.name}>
                  <TableCell component="th" scope="row">
                    <Link href={`/regions/${row.id}`} onClick={e => handlePath(row.path, e)} underline="none">
                      {row.name}
                    </Link>
                  </TableCell>
                  <TableCell>
                    <List className={classes.location_list}>
                      {row.locations && row.locations.map(loc => (
                        <ListItem key={loc.id} button onClick={e => handlePath(`/locations/${loc.id}`, e)} className={classes.root} disableGutters>
                          <ListItemText primary={locs[loc.id].name} className={classes.location_text} disableTypography />
                        </ListItem>
                      ))}
                    </List>
                  </TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
        </TableContainer>
    </div>
  );
}
