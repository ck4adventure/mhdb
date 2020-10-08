import React from 'react';
import { useSelector } from 'react-redux'

export default function Profile() {
  const userName = useSelector(state => state.session.name)
  return (
    <div className="profile__container">
      <h2>Hi there {userName}</h2>
    </div>
  );
}