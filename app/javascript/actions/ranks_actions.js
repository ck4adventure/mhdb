export const RECEIVE_RANKS = "RECEIVE_RANKS";

import * as RanksApiUtil from '../util/ranks_api';

export const receiveRanks = ranks => ({
  type: RECEIVE_RANKS,
  ranks
});

// ranks 
// [{ id: 1, title: "Novice"},...]

export const fetchRanks = () => dispatch => (
  RanksApiUtil.fetchRanks()
    .then(ranks => dispatch(receiveRanks(ranks)))
);