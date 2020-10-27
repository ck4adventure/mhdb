import { Link } from '@material-ui/core';
import React from 'react';
import { useHistory } from 'react-router-dom';
import { useSelector } from 'react-redux'

import { makeStyles } from '@material-ui/core/styles';
import CardMedia from '@material-ui/core/CardMedia';
import Typography from '@material-ui/core/Typography';


const useStyles = makeStyles(theme => ({
  media: {
    height: 20,
    width: 20,
    margin: theme.spacing(1),
  },
  icon_link: {
    display: 'flex',
    alignItems: 'center',
  },
  profile_container: {
    marginTop: 40,
  },
  info_container: {
    display: 'flex',
  },
}));

export default function ProfileShow () {
  const classes = useStyles();
  const session = useSelector(state => state.session);
  let history = useHistory();

  const profileRank = useSelector(state => state.ranks[session.rank_id]);

  function handlePath(path, event) {
    event.preventDefault();
    history.push(path);
  }

  if (!Boolean(session) || !Boolean(profileRank)) {
    return <h1>Loading...</h1>
  }
  return (
    <div className={classes.profile_container}>
      <h2>{session.username}</h2>
      <div className={classes.info_container}>
        <Typography className={classes.icon_link} >
          Rank:
        </Typography>
        <Link className={classes.icon_link} href={`/ranks/${profileRank.id}`} onClick={e => handlePath(`/ranks/${profileRank.id}`, e)}>      
          <CardMedia        
            className={classes.media}
            image={`${process.env.REACT_APP_API_URL}${profileRank.image}`}
            title={profileRank.title}
          /> 
          {profileRank.title} 
        </Link>
      </div>
    </div>
  );
}