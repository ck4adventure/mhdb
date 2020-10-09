import { Link } from '@material-ui/core';
import React from 'react';
import { useHistory } from 'react-router-dom';
import { useSelector } from 'react-redux'

export default function Profile() {
  const session = useSelector(state => state.session)
  let history = useHistory();

  function handlePath(path, event) {
    event.preventDefault();
    history.push(path);
  }

  if (!Boolean(session)) {
    return <h1>Loading...</h1>
  }
  return (
    <div className="profile__container">
      <h2>Hi there {session.name}</h2>
      <p>Your current Rank is <Link href={`/ranks/${session.rank_id}`} onClick={e => handlePath(`/ranks/${session.rank_id}`, e)}>{session.title} </Link> </p>
    </div>
  );
}