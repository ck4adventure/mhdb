import React from 'react';
import { useSelector } from 'react-redux';

import { makeStyles } from '@material-ui/core/styles';
import TextField from '@material-ui/core/TextField';
import FormLabel from '@material-ui/core/FormLabel';
import Typography from '@material-ui/core/Typography';

import FormControl from '@material-ui/core/FormControl';
import FormControlLabel from '@material-ui/core/FormControlLabel';
import InputLabel from '@material-ui/core/InputLabel';
import Select from '@material-ui/core/Select';
import MenuItem from '@material-ui/core/MenuItem';

import Button from '@material-ui/core/Button';

const useStyles = makeStyles((theme) => ({
  formHeader: {
    margin: theme.spacing(1),
  },
  nameContainer: {
    display: 'flex',
  },
  formControl: {
    margin: theme.spacing(1),
    minWidth: 140,
  },
  selectsContainer: {
    display: 'flex',
    justifyContent: 'space-between',
  },
  buttonContainer: {
    margin: theme.spacing(1),
    display: 'flex',
    justifyContent: 'flex-end',
  }
}));

export default function AddLocationForm (props) {
  const classes = useStyles();

  const regionsArr = useSelector(state =>  Object.keys(state.regions).map(regionId => ({ id: regionId, name: state.regions[regionId].name,})));
  const ranksArr = useSelector(state => Object.keys(state.ranks).map(rankId => ({id: rankId, name: state.ranks[rankId].title,})));

  const [name, setName] = React.useState("");
  const [rank, setRank] = React.useState("1");
  const [region, setRegion] = React.useState("1");

  const handleName = (e) => {
    e.preventDefault();
    setName(e.target.value);
  }

  const handleRank = (e) => {
    e.preventDefault();
    setRank(e.target.value);
  }
  const handleRegion = (e) => {
    e.preventDefault();
    setRegion(e.target.value);
  }

  const handleSubmit = (e) => {
    e.preventDefault();

    props.closeModal();
  }

  const menuItems = (arr) => arr.map(item => <MenuItem key={item.id} value={item.id}>{item.name}</MenuItem>);



  return (
    <form className={classes.root} noValidate autoComplete="off">
      <Typography variant="h6" className={classes.formHeader}>
        Add a Location
      </Typography>
      <div className={classes.nameContainer}>
        <TextField fullWidth className={classes.formControl} id="lname" name="name" onChange={handleName} value={name} label="Location Name" />
      </div>
      <br />
        <div className={classes.selectsContainer}>
        <FormControl className={classes.formControl}>
        <InputLabel id="location-region-select-label">Region</InputLabel>
        <Select
          labelId="location-region-select-label"
          id="region-select"
          value={region}
          onChange={handleRegion}
          name="regionId"
        >
          {menuItems(regionsArr)}
        </Select>
        </FormControl>
        <FormControl className={classes.formControl}>
        <InputLabel id="location-rank-select-label">Unlocked at</InputLabel>
        <Select
          labelId="location-rank-select-label"
          id="rank-select"
          value={rank}
          onChange={handleRank}
          name="rankId"
        >
          {menuItems(ranksArr)}
        </Select>
        </FormControl>
      </div>
      <div className={classes.buttonContainer}>
        <Button onClick={props.closeModal}>Cancel</Button>
        <Button variant="contained" color="primary" onClick={handleSubmit}>
          Submit
        </Button>
      </div>
    </form>
  );
}