import React, { useEffect } from "react";
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
import { fetchMainStats } from "../../actions/stats_actions";

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

  const stats = useSelector((state) => (state.stats ? state.stats : {}));

  const dispatch = useDispatch();
  useEffect(() => {
    dispatch(fetchMainStats());
  }, []);

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
              count={stats.rankCount}
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
              count={stats.regionCount}
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
              name={"locations"}
              key={"locations"}
              img={Travel}
              count={stats.locationCount}
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
              count={stats.groupCount}
            />
          </Container>
        </Paper>

        <Paper elevation={8} className={classes.single_box}>
          <Typography
            variant="h6"
            component="div"
            className={classes.box_title}
          >
            Mice
          </Typography>
          <Divider />
          <Container className={classes.cards_container}>
            <SimpleCard
              name={"mice"}
              key={"mice"}
              img={Mice}
              count={stats.miceCount}
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
            <SimpleCard
              name={"bait"}
              key={"bait"}
              img={Cheese}
              count={stats.baitCount}
            />
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
              count={stats.weaponsCount}
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
            <SimpleCard
              name={"bases"}
              key={"bases"}
              img={Traps}
              count={stats.basesCount}
            />
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
              count={stats.itemsCount}
            />
          </Container>
        </Paper>
      </Container>
    </div>
  );
}
