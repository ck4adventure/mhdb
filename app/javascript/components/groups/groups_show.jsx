import React from "react";
import { useSelector } from "react-redux";
import { useHistory } from "react-router-dom";

import { makeStyles } from "@material-ui/core/styles";
import Link from "@material-ui/core/Link";

import LocationListItem from "./location_list_item";

const useStyles = makeStyles((theme) => ({
  drawerHeader: {
    display: "flex",
    alignItems: "center",
    padding: theme.spacing(0, 1),
    // necessary for content to be below app bar
    ...theme.mixins.toolbar,
    alignContent: "flex-end",
  },
}));

export default function GroupShow(props) {
  const classes = useStyles();
  const groupId = props.match.params.groupId;
  const group = useSelector((state) => state.groups[groupId]);

  if (!Boolean(group.name)) {
    return <h1>Loading...</h1>;
  }

  let history = useHistory();

  function handlePath(path, event) {
    event.preventDefault();
    history.push(path);
  }

  return (
    <div>
      <div className={classes.drawerHeader} />
      <h2>Group Page</h2>
      <h4>{group.name}</h4>
      {/* <ul>
        {group.locations.map((loc) => (
          <LocationListItem key={loc.id} locId={loc.id} />
        ))}
      </ul> */}
      <br />
      <br />
      <Link href="/groups" onClick={(e) => handlePath("/groups", e)}>
        Back to Groups
      </Link>
    </div>
  );
}
