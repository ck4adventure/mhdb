import { Link } from '@material-ui/core';
import React from 'react';
import { useHistory } from 'react-router-dom';
import { useSelector } from 'react-redux'

const images = require.context('../../images/ranks', true)
const imagePath = (name) => images(name, true)
import { makeStyles } from '@material-ui/core/styles';
import CardMedia from '@material-ui/core/CardMedia';
import Typography from '@material-ui/core/Typography';
const useStyles = makeStyles(theme => ({
  media: {
    height: 20,
    width: 20,
  },
}));
export default function Profile() {
  const classes = useStyles();
  const session = useSelector(state => state.session)
  let history = useHistory();

  function handlePath(path, event) {
    event.preventDefault();
    history.push(path);
  }

  const ipath = imagePath('./'+`${session.title.toLowerCase()}`)
  console.log(ipath)

  if (!Boolean(session)) {
    return <h1>Loading...</h1>
  }
  return (
    <div className="profile__container">
      <h2>Hi there {session.name}</h2>
      <CardMedia        
            className={classes.media}
            image={ipath}
            title={session.title.toLowerCase()}
        />
      <Typography>
        Your current Rank is <Link href={`/ranks/${session.rank_id}`} onClick={e => handlePath(`/ranks/${session.rank_id}`, e)}>{session.title} </Link>
      </Typography>
    </div>
  );
}