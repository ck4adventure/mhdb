import React, { useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";
import { useHistory } from "react-router-dom";

import { makeStyles } from "@material-ui/core/styles";
import Link from "@material-ui/core/Link";

import MouseListItem from "./mouse_list_item";

import { fetchGroup } from "../../actions/groups_actions";

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

  let history = useHistory();

  const dispatch = useDispatch();

  useEffect(() => {
    dispatch(fetchGroup(groupId));
  }, []);

  if (!Boolean(group.mice)) {
    return <h1>Loading...</h1>;
  }

  function handlePath(path, event) {
    event.preventDefault();
    history.push(path);
  }

  return (
    <div>
      <div className={classes.drawerHeader} />
      <h2>Group Page</h2>
      <h4>{group.name}</h4>
      <ul>
        {group.mice &&
          group.mice.map((m) => <MouseListItem key={m.id} mouse={m} />)}
      </ul>
      <br />
      <br />
      <Link href="/groups" onClick={(e) => handlePath("/groups", e)}>
        Back to Groups
      </Link>
    </div>
  );
}
