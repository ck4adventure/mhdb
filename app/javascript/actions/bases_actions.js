import * as ItemsApiUtil from '../util/items_api';

export const RECEIVE_BASES = "RECEIVE_BASES";
export const RECEIVE_BASE = "RECEIVE_BASE";

// sync actions
export const receiveBases = bases => ({
  type: RECEIVE_BASES,
  bases
});

export const receiveBase = base => ({
  type: RECEIVE_BASE,
  base
});


// async actions
export const fetchBases = () => dispatch => (
  ItemsApiUtil.fetchBases()
    .then(
      bases => dispatch(receiveBases(bases)),
    )
);

export const fetchBase = (id) => dispatch => (
  ItemsApiUtil.fetchItem(id).then(base => dispatch(receiveBase(base)))
);

