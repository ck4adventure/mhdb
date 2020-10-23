import React from 'react';
import { useHistory } from "react-router-dom";

import { makeStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardActions from '@material-ui/core/CardActions';
import CardContent from '@material-ui/core/CardContent';
import Button from '@material-ui/core/Button';
import Typography from '@material-ui/core/Typography';
import Link from '@material-ui/core/Link';
import { CardMedia } from '@material-ui/core';

const images = require.context('../../images', true)
const imagePath = (name) => images(name, true);

const useStyles = makeStyles(theme => ({
  croot: {
    display: 'flex',
  },
  content: {
    padding: 0,
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    marginBottom: 0,
  },
  media: {
    height: 38,
    width: 38,
    borderRadius: 3,
  },
}));

export default function NameCard(props) {
  // props = image, name, path
  const classes = useStyles();
  let history = useHistory();

  const handlePath = (path, e) => {
    e.preventDefault();
    history.push(path);
  }

  return (
    <Card className={classes.croot} elevation={0} >
      <CardContent className={classes.content}>
         {props.image && <CardMedia        
            className={classes.media}
            image={`${process.env.REACT_APP_API_URL}${props.image}`}
            title={props.name}
        />}
      </CardContent>
      <CardActions>
        <Link href={props.path} className={classes.name} onClick={e => handlePath(props.path, e)} underline="none">
          {props.name}
        </Link>
      </CardActions>
    </Card>
  );
}
