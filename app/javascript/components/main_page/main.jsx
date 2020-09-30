import React from 'react';
import clsx from 'clsx';
import { makeStyles, useTheme } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Typography from '@material-ui/core/Typography';
import Divider from '@material-ui/core/Divider';
import Container from '@material-ui/core/Container';
import SimpleCard from '../cards/simple_card';

import ScrollableTabsButtonAuto from '../tabs/scrollable_tabs';

const useStyles = makeStyles((theme) => ({
  stats_container:{
    display: 'flex',
    justifyContent: 'center',

  },
  weapons_box: {
    display: 'flex',
    justifyContent: 'center',
    flexDirection: 'column',
    width: 851,
    marginBottom: 20,
    marginRight: 20,

  },
  single_box: {
    display: 'flex',
    flexDirection: 'column',
    // marginLeft: 20,
    marginBottom: 20,
    marginRight: 20,
  },
  box_title: {
    marginTop: 10,
    marginLeft: 10,
  },
  drawerHeader: {
    display: 'flex',
    alignItems: 'center',
    padding: theme.spacing(0, 1),
    // necessary for content to be below app bar
    ...theme.mixins.toolbar,
    alignContent: 'flex-end',
  },
  cards_container: {
    display: 'flex',
    flexWrap: 'wrap',
    justifyContent: 'center',
  },
}));

const plist = ["arcane", "draconic", "forgotten", "hydro", "law", "parental", "physical", "rift", "shadow", "tactical"];

const cardsForList = plist.map(el => <SimpleCard name={el} key={el}/>);
export default function Main () {
  const classes = useStyles();
  return (
    <div>
      <div className={classes.drawerHeader} />
      <Container className={classes.stats_container}>
        
        <Paper elevation={8} className={classes.weapons_box} >
          <Typography variant="h6" component="div" className={classes.box_title}>
            Weapons
          </Typography>
          <Divider />
          <Container className={classes.cards_container}>
            {cardsForList}
          </Container>
        </Paper>
      </Container>
      <Container className={classes.stats_container}>
        
        <Paper elevation={8} className={classes.single_box}>
          <Typography variant="h6" component="div" className={classes.box_title}>
            Bases
          </Typography>
          <Divider />
          <Container className={classes.cards_container}>
            <SimpleCard name={"bases"} />
          </Container>
        </Paper>

        <Paper elevation={8} className={classes.single_box}>
          <Typography variant="h6" component="div" className={classes.box_title}>
            Collectibles
          </Typography>
          <Divider />
          <Container className={classes.cards_container}>
            <SimpleCard name={"collectibles"} />
          </Container>
        </Paper>

        <Paper elevation={8} className={classes.single_box}>
          <Typography variant="h6" component="div" className={classes.box_title}>
            Locations
          </Typography>
          <Divider />
          <Container className={classes.cards_container}>
            <SimpleCard name={"locations"} />
          </Container>
        </Paper>

        <Paper elevation={8} className={classes.single_box}>
          <Typography variant="h6" component="div" className={classes.box_title}>
            Ranks
          </Typography>
          <Divider />
          <Container className={classes.cards_container}>
            <SimpleCard name={"ranks"} />
          </Container>
        </Paper>
      
      
      
      </Container>
    </div>
  );

}