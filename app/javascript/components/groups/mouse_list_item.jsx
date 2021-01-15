import React from "react";
import { useSelector } from "react-redux";
import { useHistory } from "react-router-dom";

import { makeStyles } from "@material-ui/core/styles";
import ListItem from "@material-ui/core/ListItem";
import ListItemText from "@material-ui/core/ListItemText";

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

function createData(mouseId, mouseName) {
  return { mouseId, mouseName };
}

export default function Mouse_List_Item(props) {
  const { mouseId } = props;

  const classes = useStyles();
  let history = useHistory();

  function handlePath(path, event) {
    event.preventDefault();
    history.push(path);
  }

  const mouse = useSelector((state) => state.mice[mouseId]);
  if (!Boolean(mouse)) {
    return <p>Loading...</p>;
  }

  return (
    <ListItem
      key={mouse.id}
      button
      onClick={(e) => handlePath(`/mice/${mouse.id}`, e)}
      className={classes.root}
      disableGutters
    >
      <ListItemText
        primary={mouse.name}
        className={classes.location_text}
        disableTypography
      />
    </ListItem>
  );
}
