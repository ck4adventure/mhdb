import React from "react";
import { useHistory } from "react-router-dom";

import { makeStyles } from "@material-ui/core/styles";
import TableCell from "@material-ui/core/TableCell";
import TableRow from "@material-ui/core/TableRow";
import Link from "@material-ui/core/Link";

import NameCard from "../cards/name_card";

const useStyles = makeStyles((theme) => ({
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

export default function LocationsTableRow(props) {
  // three parts, Location, Region, Rank
  // row = { name, id, path, image, regionId, rankId }
  const row = props.row;

  const classes = useStyles();
  let history = useHistory();

  const handlePath = (path, e) => {
    e.preventDefault();
    history.push(path);
  };

  return (
    <TableRow>
      <TableCell component="th" scope="row">
        <NameCard name={row.name} image={row.image} path={row.path} />
      </TableCell>
      <TableCell>
        <Link
          href={`/regions/${row.region.id}`}
          className={classes.name}
          onClick={(e) => handlePath(`/regions/${row.region.id}`, e)}
          underline="none"
        >
          {row.region.name}
        </Link>
      </TableCell>
      <TableCell>
        <NameCard
          name={row.rank.title}
          image={row.rank.image}
          path={`/ranks/${row.rank.id}`}
        />
      </TableCell>
    </TableRow>
  );
}
