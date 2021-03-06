import React from 'react';
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

import { useSelector, useDispatch } from 'react-redux'
import { useHistory } from 'react-router-dom';

import { signup } from '../../actions/session_actions'


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
    marginTop: theme.spacing(3),
  },
  submit: {
    margin: theme.spacing(3, 0, 2),
  },
}));

export default function SignUp() {
  const classes = useStyles();
  const dispatch = useDispatch();
  let history = useHistory();
  const [username, setUsername] = React.useState("");
  const [email, setEmail] = React.useState("");
  const [pw, setPW] = React.useState("");

  const handleInput = (type, e) => {
    switch (type) {
      case "email":
        setEmail(e.target.value);
        break;
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
                 email: email,
                 password: pw };
    e.preventDefault();
    dispatch(signup(user));
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
          Sign up
        </Typography>
        <form className={classes.form} noValidate>
          <Grid container spacing={2}>
            <Grid item xs={12}>
              <TextField
                autoComplete="fname"
                name="user[username]"
                variant="outlined"
                required
                fullWidth
                id="user_name"
                label="Username (must be unique)"
                autoFocus
                onChange={e => handleInput("username", e)}
              />
            </Grid>
            <Grid item xs={12}>
              <TextField
                variant="outlined"
                required
                fullWidth
                id="email"
                label="Email Address"
                name="email"
                autoComplete="email"
                onChange={e => handleInput("email", e)}
              />
            </Grid>
            <Grid item xs={12}>
              <TextField
                autoComplete="fname"
                name="user[password]"
                variant="outlined"
                required
                fullWidth
                type="password"
                id="user_pw"
                label="Password (6 char min.)"
                onChange={e => handleInput("pw", e)}
              />
            </Grid>
          </Grid>
          <Button
            type="submit"
            fullWidth
            variant="contained"
            color="primary"
            className={classes.submit}
            onClick={handleSubmit}
          >
            Sign Up
          </Button>
          <Grid container justify="flex-end">
            <Grid item>
              <Link href="#/login" variant="body2">
                Already have an account? Sign in
              </Link>
            </Grid>
          </Grid>
        </form>
      </div>
    </Container>
  );
}