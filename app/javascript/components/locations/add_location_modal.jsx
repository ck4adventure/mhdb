import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Modal from '@material-ui/core/Modal';

import Fab from '@material-ui/core/Fab';
import AddIcon from '@material-ui/icons/Add';
import TextField from '@material-ui/core/TextField';

function getModalStyle() {
  const top = 50;
  const left = 50;

  return {
    top: `${top}%`,
    left: `${left}%`,
    transform: `translate(-${top}%, -${left}%)`,
  };
}

const useStyles = makeStyles((theme) => ({
  paper: {
    position: 'absolute',
    width: 400,
    backgroundColor: theme.palette.background.paper,
    border: '2px solid #000',
    boxShadow: theme.shadows[5],
    padding: theme.spacing(2, 4, 3),
  },
  fab_pos: {
    position: 'fixed',
    right: 0,
    bottom: 0,
    margin: theme.spacing(2),
  },
}));

export default function AddLocationModal() {
  const classes = useStyles();
  // getModalStyle is not a pure function, we roll the style only on the first render
  const [modalStyle] = React.useState(getModalStyle);
  const [open, setOpen] = React.useState(false);

  const handleOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };

  const body = (
    <div style={modalStyle} className={classes.paper}>
      <h2 id="simple-modal-title">Need to pick a style</h2>
      <form className={classes.root} noValidate autoComplete="off">
        <TextField id="standard-basic" label="Trap Name" />
        <br/>
        <TextField id="filled-basic" label="Trap Name" variant="filled" />
        <br/>
        <TextField id="outlined-basic" label="Trap Name" variant="outlined" />
      </form>
      <button type="button" onClick={handleClose}>Close Modal</button>
    </div>
  );

  return (
    <div>
      <Fab color="secondary" className={classes.fab_pos} onClick={handleOpen}>
        <AddIcon />
      </Fab>
      <Modal
        open={open}
        onClose={handleClose}
        aria-labelledby="simple-modal-title"
        aria-describedby="simple-modal-description"
      >
        {body}
      </Modal>
    </div>
  );
}
