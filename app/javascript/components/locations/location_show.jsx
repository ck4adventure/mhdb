import React, { useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";
import { useHistory } from "react-router-dom";

import { makeStyles } from "@material-ui/core/styles";
import Container from "@material-ui/core/Container";
import CardMedia from "@material-ui/core/CardMedia";
import Typography from "@material-ui/core/Typography";
import Table from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableContainer from "@material-ui/core/TableContainer";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";

import Link from "@material-ui/core/Link";
import Paper from "@material-ui/core/Paper";

// import EditLocationModal from "./edit_location_modal";

import { fetchLocation } from "../../actions/locations_actions";

const useStyles = makeStyles((theme) => ({
  drawerHeader: {
    display: "flex",
    alignItems: "center",
    padding: theme.spacing(0, 1),
    // necessary for content to be below app bar
    ...theme.mixins.toolbar,
    alignContent: "flex-end",
  },
  titleContainer: {
    display: "flex",
    alignItems: "center",
  },
  media: {
    height: 38,
    width: 38,
    borderRadius: 3,
  },
  title: {
    padding: 0,
    paddingLeft: 5,
  },
  table: {
    minWidth: 650,
  },
}));

export default function LocationShow(props) {
  const classes = useStyles();
  const locationId = props.match.params.locationId;
  const location = useSelector((state) => state.locations[locationId]);
  // const user = Boolean(useSelector((state) => state.session.id));
  let history = useHistory();

  const dispatch = useDispatch();
  useEffect(() => {
    dispatch(fetchLocation(locationId));
  }, []);

  if (!Boolean(location)) {
    return <h1>Loading...</h1>;
  }

  function handlePath(path, event) {
    event.preventDefault();
    history.push(path);
  }

  return (
    <div>
      <div className={classes.drawerHeader} />
      <Container className={classes.titleContainer}>
        {location.image && (
          <CardMedia
            className={classes.media}
            image={`${process.env.REACT_APP_API_URL}${location.image}`}
            title={location.name}
          />
        )}
        <Typography variant="h4" className={classes.title}>
          {location.name}
        </Typography>
      </Container>
      <p>
        The {location.name} is found within the region of{" "}
        <Link
          href={`/regions/${location.region.id}`}
          onClick={(e) => handlePath(`/regions/${location.region.id}`, e)}
        >
          {location.region.name}
        </Link>
        .
      </p>
      <p>
        The minimum Rank for this location is{" "}
        <Link
          href={`/ranks/${location.rank.id}`}
          onClick={(e) => handlePath(`/ranks/${location.rank.id}`, e)}
        >
          {location.rank.title}
        </Link>
        .
      </p>
      <br />
      <h4>Mice in this location</h4>
      <TableContainer component={Paper}>
        <Table className={classes.table} aria-label="simple table">
          <TableHead>
            <TableRow>
              <TableCell>Name</TableCell>
              <TableCell>Points</TableCell>
              <TableCell>Gold</TableCell>
              <TableCell>Loot</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {location.mice &&
              location.mice.map((mouse) => (
                <TableRow key={`loc-mouse-${mouse.name}`}>
                  <TableCell component="th" scope="row">
                    <Link
                      href={`/mice/${mouse.id}`}
                      onClick={(e) => handlePath(`/mice/${mouse.id}`, e)}
                    >
                      {mouse.name}
                    </Link>
                  </TableCell>
                  <TableCell>{mouse.points}</TableCell>
                  <TableCell>{mouse.gold}</TableCell>
                  <TableCell>.</TableCell>
                </TableRow>
              ))}
          </TableBody>
        </Table>
      </TableContainer>
      <br />
      <Link href="/locations" onClick={(e) => handlePath("/locations", e)}>
        Back to Locations
      </Link>
      {/* {user && <EditLocationModal locationId={location.id} />} */}
    </div>
  );
}
