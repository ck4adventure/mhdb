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
import Typography from '@material-ui/core/Typography';
import NameCard from '../cards/name_card';

import AddLocationModal from './add_location_modal';


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
  name_box: {
    display: 'flex',
    alignItems: 'center',
  },
  media: {
    height: 25,
    width: 25,
    borderRadius: 3,
  },
  name: {
   padding: 0,
   paddingLeft: 5,
   fontSize: 14,
  },
  margin: {
    margin: theme.spacing(2),
    position: 'fixed',
    bottom: 0,
    right: 0,
  },
}))

function createData(name, id, path, image, region, rank) {
  return { name, id, path, image, region, rank }
}
export default function LocationsIndex () {
  const locs = useSelector(state => state.locations);
  const user = Boolean(useSelector(state => state.session.id));
  const classes = useStyles();
  let history = useHistory();

  const handlePath = (path, e) => {
    e.preventDefault();
    history.push(path);
  }
  
  const rows = Object.keys(locs).map(id => createData(locs[id].name, id, `/locations/${id}`, locs[id].image, locs[id].region, locs[id].rank));

  if (rows.length == 0) {
    return <h1>Loading...</h1>
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
                    <NameCard name={row.name} image={row.image} path={row.path} />
                  </TableCell>
                  <TableCell>
                    <Link href={`/regions/${row.region.id}`} className={classes.name} onClick={e => handlePath(`/regions/${row.region.id}`, e)} underline="none">
                      {row.region.name}
                    </Link>
                  </TableCell>
                  <TableCell>
                    <NameCard name={row.rank.title} ipath={row.rank.ipath} path={`/ranks/${row.rank.id}`} />
                  </TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
        </TableContainer>
        {user && 
          <AddLocationModal />}
    </div>
  );
}
