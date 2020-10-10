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

const images = require.context('../../images', true)
const imagePath = (name) => images(name, true);

import CardMedia from '@material-ui/core/CardMedia';


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
    minWidth: 500,
  },
  media: {
    height: 30,
    width: 30,
  },
}))

function createData(name, id, path) {
  const ipath = './' + name.split(" ").join("").toLowerCase();
  return { name, id, path, ipath}
}

export default function RanksIndex () {
  const r = useSelector(state => state.ranks);
  const classes = useStyles();
  let history = useHistory();

  const handlePath = (path, e) => {
    e.preventDefault();
    history.push(path);
  }
  
  const rows = Object.keys(r).map(id => createData(r[id].title, id, `/ranks/${id}`));

  if (rows.length == 0) {
    return <h1>Loading</h1>
  }
  
  return (
    <div>
      <div className={classes.drawerHeader} />
        <h2>All the Ranks</h2>
        <TableContainer component={Paper}>
          <Table className={classes.table} aria-label="simple table">
            <TableHead>
              <TableRow>
                <TableCell padding="checkbox">Image</TableCell>
                <TableCell>Title</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {rows.map((row) => (
                <TableRow key={row.name}>
                  <TableCell padding="checkbox">
                    <CardMedia        
                        className={classes.media}
                        image={imagePath(row.ipath)}
                        title={row.name}
                    />
                  </TableCell>
                  <TableCell component="th" scope="row">
                    <Link href={`/ranks/${row.id}`} onClick={e => handlePath(row.path, e)} underline="none">
                      {row.name}
                    </Link>
                  </TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
        </TableContainer>
    </div>
  );
}
