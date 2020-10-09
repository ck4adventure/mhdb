export const RECEIVE_LOCATIONS = "RECEIVE_LOCATIONS"

import * as LocationsApiUtil from '../util/locations_api'

export const receiveLocations = locations => ({
  type: RECEIVE_LOCATIONS,
  locations
});

// locations
// [{id: 1, name: "Meadow", rank: "Novice", region: "Gnawnia"}, ...]

export const fetchAllLocations = () => dispatch => (
  LocationsApiUtil.fetchLocations()
    .then(locations => dispatch(receiveLocations(locations)),
  )
);