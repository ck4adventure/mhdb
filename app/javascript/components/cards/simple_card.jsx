import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardActions from '@material-ui/core/CardActions';
import CardContent from '@material-ui/core/CardContent';
import Button from '@material-ui/core/Button';
import Typography from '@material-ui/core/Typography';

const useStyles = makeStyles({
  croot: {
    // maxWidth: 150,
    margin: 10,
    display: 'flex',
    // flexDirection: 'column',
    alignItems: 'center',
  },
  bullet: {
    display: 'inline-block',
    margin: '0 2px',
    transform: 'scale(0.8)',
  },
  content: {
    padding: 4,
  },
  number_box: {
    textAlign: 'center',
  }
});

export default function SimpleCard(props) {
  const classes = useStyles();
  const bull = <span className={classes.bullet}>•</span>;

  return (
    <Card className={classes.croot} variant="outlined">
      <CardContent className={classes.content}>
        <Typography className={classes.number_box}>
          19/23
        </Typography>
      </CardContent>
      <CardActions>
        <Button size="small">{props.name}</Button>
      </CardActions>
    </Card>
  );
}
