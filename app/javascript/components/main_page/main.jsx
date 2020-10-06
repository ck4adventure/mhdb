import React, { Fragment, useState, useEffect }  from 'react';
import {useSelector, useDispatch} from 'react-redux';
import clsx from 'clsx';
import { makeStyles, useTheme } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Typography from '@material-ui/core/Typography';
import Divider from '@material-ui/core/Divider';
import Container from '@material-ui/core/Container';
import SimpleCard from '../cards/simple_card';

import ScrollableTabsButtonAuto from '../tabs/scrollable_tabs';

import Arcane from '../../images/arcane.png';
import Draconic from '../../images/draconic.png';
import Forgotten from '../../images/forgotten.png';
import Hydro from '../../images/hydro.png';
import Law from '../../images/law.png';
import Parental from '../../images/parental.png';
import Rift from '../../images/rift.png';
import Shadow from '../../images/shadow.png';
import Tactical from '../../images/tactical.png';
import Physical from '../../images/physical.png';
import Traps from '../../images/traps.png';
import Collectibles from '../../images/collectibles.png';
import Travel from '../../images/travel.png';
import Recruit from '../../images/recruit.gif';
import { fetchAllWeapons } from '../../actions/weapons_actions';
import { fetchAllBases } from '../../actions/bases_actions';
import { toArray } from '../../reducers/selectors';


const useStyles = makeStyles((theme) => ({
  stats_container:{
    display: 'flex',
    justifyContent: 'center',

  },
  weapons_box: {
    display: 'flex',
    justifyContent: 'center',
    flexDirection: 'column',
    maxWidth: 530,
    marginBottom: 20,
    marginRight: 20,

  },
  single_box: {
    display: 'flex',
    flexDirection: 'column',
    // marginLeft: 20,
    marginBottom: 20,
    marginRight: 20,
    justifyContent: 'center',
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
const flist = [ {name: "arcane", img: Arcane}, {name: "draconic", img: Draconic }, {name: "forgotten", img: Forgotten },
                {name: "hydro", img: Hydro}, {name: "law", img: Law }, {name: "parental", img: Parental },
                {name: "physical", img: Physical}, {name: "rift", img: Rift }, {name: "shadow", img: Shadow }, {name: "tactical", img: Tactical },];



const cardsForList = flist.map(el => <SimpleCard name={el.name} key={el.name} img={el.img} count={10} />);

export default function Main () {
  const classes = useStyles();
  const bases = useSelector(state => state.items.bases ? toArray(state.items.bases) : []);
  const dispatch = useDispatch();

  useEffect(() => {
    dispatch(fetchAllWeapons());
    dispatch(fetchAllBases());
  }, []);

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
            <SimpleCard name={"bases"} key={"bases"} img={Traps} count={bases.length}/>
          </Container>
        </Paper>

        <Paper elevation={8} className={classes.single_box}>
          <Typography variant="h6" component="div" className={classes.box_title}>
            Collectibles
          </Typography>
          <Divider />
          <Container className={classes.cards_container}>
            <SimpleCard name={"collectibles"} key={"collectibles"} img={Collectibles} />
          </Container>
        </Paper>

        <Paper elevation={8} className={classes.single_box}>
          <Typography variant="h6" component="div" className={classes.box_title}>
            Locations
          </Typography>
          <Divider />
          <Container className={classes.cards_container}>
            <SimpleCard name={"locations"} key={"locations"} img={Travel}/>
          </Container>
        </Paper>
      
      
      
      </Container>
    </div>
  );

}