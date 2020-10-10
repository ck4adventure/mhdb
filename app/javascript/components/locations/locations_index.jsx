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
import CardMedia from '@material-ui/core/CardMedia';
import Typography from '@material-ui/core/Typography';


const images = require.context('../../images/locations', true)
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
}))

function createData(name, id, path, ipath, region, rank) {
  console.log(ipath)
  return { name, id, path, ipath, region, rank }
}
export default function LocationsIndex () {
  const locs = useSelector(state => state.locations);
  const classes = useStyles();
  let history = useHistory();

  const handlePath = (path, e) => {
    e.preventDefault();
    history.push(path);
  }
  
  const rows = Object.keys(locs).map(id => createData(locs[id].name, id, `/locations/${id}`, locs[id].ipath, locs[id].region.name, locs[id].rank.title));

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
                    <div className={classes.name_box}>
                      <CardMedia        
                          className={classes.media}
                          image={imagePath(row.ipath)}
                          title={row.name}
                      />
                      <Typography className={classes.name} >
                        <Link href={`/locations/${row.id}`} onClick={e => handlePath(row.path, e)} underline="none">
                          {row.name}
                        </Link>
                      </Typography>
                    </div>
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
