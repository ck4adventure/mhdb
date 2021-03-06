import React from 'react';
import { useDispatch } from 'react-redux';
import Avatar from '@material-ui/core/Avatar';
import Button from '@material-ui/core/Button';
import CssBaseline from '@material-ui/core/CssBaseline';
import TextField from '@material-ui/core/TextField';
import FormControlLabel from '@material-ui/core/FormControlLabel';
import Checkbox from '@material-ui/core/Checkbox';
import Link from '@material-ui/core/Link';
import Grid from '@material-ui/core/Grid';
import AccountBoxIcon from '@material-ui/icons/AccountBox';
import Typography from '@material-ui/core/Typography';
import { makeStyles } from '@material-ui/core/styles';
import Container from '@material-ui/core/Container';

import { login } from '../../actions/session_actions'
import { useHistory, withRouter } from "react-router-dom";


const useStyles = makeStyles((theme) => ({
  paper: {
    marginTop: theme.spacing(8),
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
  },
  avatar: {
    margin: theme.spacing(1),
    backgroundColor: theme.palette.secondary.main,
  },
  form: {
    width: '100%', // Fix IE 11 issue.
    marginTop: theme.spacing(1),
  },
  submit: {
    margin: theme.spacing(3, 0, 2),
  },
  guest_submit: {
    margin: theme.spacing(1, 0, 2),
  },
}));

export default function SignIn() {
  const classes = useStyles();
  const dispatch = useDispatch();
  let history = useHistory();
  const [username, setUsername] = React.useState("");
  const [pw, setPW] = React.useState("");

  const handleInput = (type, e) => {
    switch (type) {
      case "username":
        setUsername(e.target.value);
        break;
      case "pw":
        setPW(e.target.value);
      default:
        break;
    }
  }

  const handleSubmit = (e) => {
    let user = { username: username,
                 password: pw };
    e.preventDefault();
    dispatch(login(user));
    history.push('/');
  }

  const handleGuestSubmit = (e) => {
    let user = { username: "Guest",
                 password: "guestpass" };
    e.preventDefault();
    dispatch(login(user));
    history.push('/');
  }
  return (
    <Container component="main" maxWidth="xs">
      <CssBaseline />
      <div className={classes.paper}>
        <Avatar className={classes.avatar}>
          <AccountBoxIcon />
        </Avatar>
        <Typography component="h1" variant="h5">
          Sign in
        </Typography>
        <form className={classes.form} noValidate>
          <TextField
            variant="outlined"
            margin="normal"
            required
            fullWidth
            id="user_username"
            label="Username"
            name="user[username]"
            autoFocus
            onChange={e => handleInput("username", e)}
          />
          <TextField
            variant="outlined"
            margin="normal"
            required
            fullWidth
            id="user_password"
            label="Password"
            type="password"
            name="user[password]"
            onChange={e => handleInput("pw", e)}
          />
          <Button
            type="submit"
            fullWidth
            variant="contained"
            color="primary"
            className={classes.submit}
            onClick={handleSubmit}
          >
            Sign In
          </Button>
          <Grid container>
            <Grid item xs>
              <Link href="#" variant="body2">
                Forgot password?
              </Link>
            </Grid>
            <Grid item>
              <Link href="#/signup" variant="body2">
                {"Don't have an account? Sign Up"}
              </Link>
            </Grid>
          </Grid>
        </form>
      </div>
      <br />
      <br />
      <Button
        type="submit"
        fullWidth
        variant="contained"
        color="secondary"
        className={classes.submit}
        onClick={handleGuestSubmit}
      >
        Sign In as Guest
      </Button>

    </Container>
  );
}