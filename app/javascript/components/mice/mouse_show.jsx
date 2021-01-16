import React, { useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";
import { useHistory } from "react-router-dom";

import { makeStyles } from "@material-ui/core/styles";
import Container from "@material-ui/core/Container";
import CardMedia from "@material-ui/core/CardMedia";
import Typography from "@material-ui/core/Typography";
import Link from "@material-ui/core/Link";

import { fetchMouse } from "../../actions/mice_actions";

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
    flexDirection: "column",
    alignItems: "center",
  },
  media: {
    height: 451,
    width: 301,
    borderRadius: 3,
  },
  title: {
    padding: 0,
    paddingLeft: 5,
  },
}));

export default function MouseShow(props) {
  const classes = useStyles();
  const mouseId = props.match.params.mouseId;
  const mouse = useSelector((state) => state.mice[mouseId]);

  let history = useHistory();

  const dispatch = useDispatch();
  console.log(mouseId);

  useEffect(() => {
    dispatch(fetchMouse(mouseId));
  }, []);

  if (!Boolean(mouse)) {
    return <h1>Loading...</h1>;
  }
  console.log(mouse);

  function handlePath(path, event) {
    event.preventDefault();
    history.push(path);
  }

  return (
    <div>
      <div className={classes.drawerHeader} />
      <Container className={classes.titleContainer}>
        <Typography variant="h4" className={classes.title}>
          {mouse.name} Mouse
        </Typography>
        {mouse.image && (
          <CardMedia
            className={classes.media}
            image={`${process.env.REACT_APP_API_URL}${mouse.image}`}
            title={mouse.name}
          />
        )}
      </Container>
      <p>
        The {mouse.name} mouse is part of the{" "}
        <Link
          href={`/groups/${mouse.groupId}`}
          onClick={(e) => handlePath(`/groups/${mouse.groupId}`, e)}
        >
          {mouse.group}
        </Link>
        .
      </p>
      <p>
        It is worth {mouse.points} points and {mouse.gold} gold.
      </p>
      <br />
      <br />
      <Link href="/groups" onClick={(e) => handlePath("/groups", e)}>
        Back to Groups
      </Link>
    </div>
  );
}
