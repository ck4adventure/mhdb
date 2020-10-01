import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardActions from '@material-ui/core/CardActions';
import CardContent from '@material-ui/core/CardContent';
import Button from '@material-ui/core/Button';
import Typography from '@material-ui/core/Typography';
import { CardMedia } from '@material-ui/core';


const useStyles = makeStyles(theme => ({
  croot: {
    minWidth: 75,
    margin: 10,
    display: 'flex',
    flexDirection: 'column',

  },
  content: {
    padding: 0,
    margin: 4,
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    marginBottom: 0,
  },
  number_box: {
    marginLeft: 6,
    fontSize: 14,
    color: theme.palette.primary.main,

  },
  media: {
    height: 20,
    width: 20,
  },
  button_box: {
    padding: 0,
    justifyContent: 'center',
  },
  button_text: {
    fontSize: 11,
    color: 'gray',
  }
}));

export default function SimpleCard(props) {
  const classes = useStyles();


  return (
    <Card className={classes.croot} variant="outlined">
      <CardContent className={classes.content}>
        <CardMedia        
            className={classes.media}
            image={props.img}
            title={props.name}
        />
        <Typography className={classes.number_box}>
          19/23
        </Typography>
      </CardContent>
      <CardActions className={classes.button_box}>
        <Button size="small" className={classes.button_text}>{props.name}</Button>
      </CardActions>
    </Card>
  );
}
