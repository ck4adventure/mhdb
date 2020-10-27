import React from 'react';
import { useSelector, useDispatch } from 'react-redux';

import { createLocation } from '../../actions/locations_actions';

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
import CloudUploadIcon from '@material-ui/icons/CloudUpload';

const useStyles = makeStyles((theme) => ({
  root: {
    '& > *': {
      margin: theme.spacing(1),
    },
  },
  headerContainer: {
    margin: theme.spacing(1),
  },
  nameContainer: {
    margin: theme.spacing(1),
    display: 'flex',
    flexDirection: 'column',
  },
  uploadContainer: {
    margin: theme.spacing(1),
    display: 'flex',
    alignItems: 'center',
    marginTop: theme.spacing(2),
  },
  input: {
    display: 'none',
  },
  formControl: {
    margin: theme.spacing(1),
  },
  selectsContainer: {
    margin: theme.spacing(1),
    display: 'flex',
    justifyContent: 'space-between',
  },
  formControlSelect: {
    margin: theme.spacing(1),
    minWidth: 140,
  },
  buttonContainer: {
    margin: theme.spacing(1),
    display: 'flex',
    justifyContent: 'flex-end',
  }
}));

export default function AddLocationForm (props) {
  const classes = useStyles();
  const dispatch = useDispatch();

  const regionsArr = useSelector(state =>  Object.keys(state.regions).map(regionId => ({ id: regionId, name: state.regions[regionId].name,})));
  const ranksArr = useSelector(state => Object.keys(state.ranks).map(rankId => ({id: rankId, name: state.ranks[rankId].title,})));

  const [name, setName] = React.useState("");
  const [rankId, setRankId] = React.useState("1");
  const [regionId, setRegionId] = React.useState("1");
  const [image, setImage] = React.useState({ name: "Upload Image" });

  const handleName = (e) => {
    e.preventDefault();
    setName(e.target.value);
  }

  const handleRank = (e) => {
    e.preventDefault();
    setRankId(e.target.value);
  }
  const handleRegion = (e) => {
    e.preventDefault();
    setRegionId(e.target.value);
  }

  const handleImage = (e) => {
    if (e.target.files[0]) {
      setImage(e.target.files[0])
    }
  }

  const handleSubmit = (e) => {
    e.preventDefault();
    const formData = new FormData();
    formData.append('location[name]', name);
    formData.append('location[rank_id]', rankId);
    formData.append('location[region_id]', regionId);
    formData.append('location[image]', image);
    dispatch(createLocation(formData)).then(succ => props.closeModal());
  }

  const menuItems = (arr) => arr.map(item => <MenuItem key={item.id} value={item.id}>{item.name}</MenuItem>);



  return (
    <form className={classes.root} noValidate autoComplete="off">
      <div className={classes.headerContainer}>
        <Typography variant="h6" className={classes.formControl}>
          Add a Location
        </Typography>
      </div>
      <div className={classes.nameContainer}>
        <FormControl className={classes.formControl}>
          <TextField  id="lname" name="name" onChange={handleName} value={name} label="Location Name" helperText="Exactly as displayed"/>
        </FormControl>
      </div>
      <div className={classes.selectsContainer}>
        <FormControl className={classes.formControlSelect}>
          <InputLabel id="location-region-select-label">Region</InputLabel>
          <Select
            labelId="location-region-select-label"
            id="region-select"
            value={regionId}
            onChange={handleRegion}
            name="regionId"
          >
            {menuItems(regionsArr)}
          </Select>
        </FormControl>
        <FormControl className={classes.formControlSelect}>
          <InputLabel id="location-rank-select-label">Unlocked at</InputLabel>
          <Select
            labelId="location-rank-select-label"
            id="rank-select"
            value={rankId}
            onChange={handleRank}
            name="rankId"
          >
            {menuItems(ranksArr)}
          </Select>
        </FormControl>
      </div>
      <div className={classes.uploadContainer}>
        <FormControl className={classes.formControl}>
          <input
            accept="image/*"
            className={classes.input}
            id="img-upload-file"
            type="file"
            name="image"
            onChange={handleImage}
          />
          <label htmlFor="img-upload-file">
            <Button startIcon={<CloudUploadIcon />} variant="contained" color="default" size="small" component="span">
              Image
            </Button>
          </label>
        </FormControl>
        <FormControl className={classes.formControl}>
          {image && <Typography>
            {image.name}
          </Typography> }

        </FormControl>
        </div>
      <div className={classes.buttonContainer}>
        <Button onClick={props.closeModal} color="default" >Cancel</Button>
        <Button className={classes.formControl} variant="contained" color="primary" onClick={handleSubmit}>
          Submit
        </Button>
      </div>
    </form>
  );
}