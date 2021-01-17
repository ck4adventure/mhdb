import React, { useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";

import { makeStyles } from "@material-ui/core/styles";

import Table from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableContainer from "@material-ui/core/TableContainer";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";
import Paper from "@material-ui/core/Paper";

import RegionsTableRow from "./regions_table_row";

import { fetchAllRegions } from "../../actions/regions_actions";

const useStyles = makeStyles((theme) => ({
  drawerHeader: {
    display: "flex",
    alignItems: "center",
    padding: theme.spacing(0, 1),
    // necessary for content to be below app bar
    ...theme.mixins.toolbar,
    alignContent: "flex-end",
  },
  table: {
    minWidth: 800,
  },
  location_list: {
    display: "flex",
    flexDirection: "row",
  },
  root: {
    width: "inherit",
  },
  location_text: {
    color: "indigo",
    marginRight: 16,
  },
}));

function createData(regionName, regionId, regionLinkPath, regionLocations) {
  return { regionName, regionId, regionLinkPath, regionLocations };
}
export default function RegionsPage() {
  const regions = useSelector((state) => Object.keys(state.regions));
  const classes = useStyles();

  const dispatch = useDispatch();
  useEffect(() => {
    dispatch(fetchAllRegions());
  }, []);

  if (Object.keys(regions).length < 1) {
    return <h1>Loading</h1>;
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
            {regions.map((regionId) => (
              <RegionsTableRow key={`regions-${regionId}`} regId={regionId} />
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    </div>
  );
}
