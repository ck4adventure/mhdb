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
  table: {
    minWidth: 650,
  },
}))

function createData(name, id, path, region, rank) {
  return { name, id, path, region, rank }
}
export default function LocationsIndex () {
  const r = useSelector(state => state.locations);
  const classes = useStyles();
  let history = useHistory();

  const handlePath = (path, e) => {
    e.preventDefault();
    history.push(path);
  }
  
  const rows = Object.keys(r).map(id => createData(r[id].name, id, `/locations/${id}`, r[id].region, r[id].rank));

  if (rows.length == 0) {
    return <h1>Loading</h1>
  }
  
  return (
    <div>
      <div className={classes.drawerHeader} />
        <h2>All the Locations</h2>
        <TableContainer component={Paper}>
          <Table className={classes.table} aria-label="simple table">
            <TableHead>
              <TableRow>
                <TableCell>Name</TableCell>
                <TableCell>Region</TableCell>
                <TableCell>Rank</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {rows.map((row) => (
                <TableRow key={row.name}>
                  <TableCell component="th" scope="row">
                    <Link href={`/locations/${row.id}`} onClick={e => handlePath(row.path, e)} underline="none">
                      {row.name}
                    </Link>
                  </TableCell>
                  <TableCell>
                    {row.region}
                  </TableCell>
                  <TableCell>
                    {row.rank}
                  </TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
        </TableContainer>
    </div>
  );
}
