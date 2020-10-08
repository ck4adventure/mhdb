export const RECEIVE_REGIONS = "RECEIVE_REGIONS";

import * as RegionsApiUtil from '../util/regions_api';

export const receiveRegions = regions => ({
  type: RECEIVE_REGIONS,
  regions
});

// regions
// [{id: 1, name: "Gnawnia"},...]

export const fetchRegions = () => dispatch => (
  RegionsApiUtil.fetchRegions().then(regions => dispatch(receiveRegions(regions)),
  )
);