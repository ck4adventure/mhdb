import React from "react";
import { useSelector, useDispatch } from "react-redux";
import clsx from "clsx";
import { makeStyles, useTheme } from "@material-ui/core/styles";
import Paper from "@material-ui/core/Paper";
import Typography from "@material-ui/core/Typography";
import Divider from "@material-ui/core/Divider";
import Container from "@material-ui/core/Container";
import SimpleCard from "../cards/simple_card";

const images = require.context("../../images", true);
const imagePath = (name) => images(name, true);

import Traps from "../../images/traps.png";
import Cheese from "../../images/cheese.png";
import Travel from "../../images/travel.png";
import Recruit from "../../images/recruit.gif";
import Mice from "../../images/mice.png";
import Special from "../../images/special.png";

import { toArray } from "../../reducers/selectors";

const useStyles = makeStyles((theme) => ({
  stats_container: {
    display: "flex",
    justifyContent: "center",
  },
  weapons_box: {
    display: "flex",
    justifyContent: "center",
    flexDirection: "column",
    maxWidth: 530,
    marginBottom: 20,
    marginRight: 20,
  },
  single_box: {
    display: "flex",
    flexDirection: "column",
    // marginLeft: 20,
    marginBottom: 20,
    marginRight: 20,
    justifyContent: "center",
  },
  box_title: {
    marginTop: 10,
    marginLeft: 10,
  },
  drawerHeader: {
    display: "flex",
    alignItems: "center",
    padding: theme.spacing(0, 1),
    // necessary for content to be below app bar
    ...theme.mixins.toolbar,
    alignContent: "flex-end",
  },
  cards_container: {
    display: "flex",
    flexWrap: "wrap",
    justifyContent: "left",
  },
}));

const plist = [
  "arcane",
  "draconic",
  "forgotten",
  "hydro",
  "law",
  "parental",
  "physical",
  "rift",
  "shadow",
  "tactical",
];

const cardsForList = plist.map((el) => (
  <SimpleCard name={el} key={el} img={imagePath("./" + `${el}`)} count={10} />
));

export default function Main() {
  const classes = useStyles();

  const ranks = useSelector((state) =>
    state.ranks ? toArray(state.ranks) : []
  );

  return (
    <div>
      <div className={classes.drawerHeader} />

      <Container className={classes.cards_container}>
        <Paper elevation={8} className={classes.single_box}>
          <Typography
            variant="h6"
            component="div"
            className={classes.box_title}
          >
            Ranks
          </Typography>
          <Divider />
          <Container className={classes.cards_container}>
            <SimpleCard
              name={"ranks"}
              key={"ranks"}
              img={Recruit}
              count={ranks.length}
            />
          </Container>
        </Paper>

        <Paper elevation={8} className={classes.single_box}>
          <Typography
            variant="h6"
            component="div"
            className={classes.box_title}
          >
            Regions
          </Typography>
          <Divider />
          <Container className={classes.cards_container}>
            <SimpleCard
              name={"regions"}
              key={"regions"}
              img={Travel}
              count={"42"}
            />
          </Container>
        </Paper>

        <Paper elevation={8} className={classes.single_box}>
          <Typography
            variant="h6"
            component="div"
            className={classes.box_title}
          >
            Locations
          </Typography>
          <Divider />
          <Container className={classes.cards_container}>
            <SimpleCard
              name={"regions"}
              key={"regions"}
              img={Travel}
              count={"173"}
            />
          </Container>
        </Paper>

        <Paper elevation={8} className={classes.single_box}>
          <Typography
            variant="h6"
            component="div"
            className={classes.box_title}
          >
            Groups
          </Typography>
          <Divider />
          <Container className={classes.cards_container}>
            <SimpleCard
              name={"groups"}
              key={"groups"}
              img={Mice}
              count={"27"}
            />
          </Container>
        </Paper>

        <Paper elevation={8} className={classes.single_box}>
          <Typography
            variant="h6"
            component="div"
            className={classes.box_title}
          >
            Bait
          </Typography>
          <Divider />
          <Container className={classes.cards_container}>
            <SimpleCard name={"bait"} key={"bait"} img={Cheese} count={"16"} />
          </Container>
        </Paper>

        <Paper elevation={8} className={classes.single_box}>
          <Typography
            variant="h6"
            component="div"
            className={classes.box_title}
          >
            Weapons
          </Typography>
          <Divider />
          <Container className={classes.cards_container}>
            <SimpleCard
              name={"weapons"}
              key={"weapons"}
              img={Traps}
              count={"1000"}
            />
          </Container>
        </Paper>

        <Paper elevation={8} className={classes.single_box}>
          <Typography
            variant="h6"
            component="div"
            className={classes.box_title}
          >
            Bases
          </Typography>
          <Divider />
          <Container className={classes.cards_container}>
            <SimpleCard name={"bases"} key={"bases"} img={Traps} count={"44"} />
          </Container>
        </Paper>

        <Paper elevation={8} className={classes.single_box}>
          <Typography
            variant="h6"
            component="div"
            className={classes.box_title}
          >
            Lootable Items
          </Typography>
          <Divider />
          <Container className={classes.cards_container}>
            <SimpleCard
              name={"loot"}
              key={"loot"}
              img={Special}
              count={"600"}
            />
          </Container>
        </Paper>
      </Container>
    </div>
  );
}
