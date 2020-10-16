export const RECEIVE_LOCATIONS = "RECEIVE_LOCATIONS";
export const RECEIVE_LOCATION = "RECEIVE_LOCATION";
export const RECEIVE_LOCATION_ERRORS = "RECEIVE_LOCATION_ERRORS";


import * as LocationsApiUtil from '../util/locations_api'

export const receiveLocations = locations => ({
  type: RECEIVE_LOCATIONS,
  locations
});

export const receiveLocation = location => ({
  type: RECEIVE_LOCATION,
  location
})

export const receiveErrors = errors => ({
  type: RECEIVE_LOCATION_ERRORS,
  errors
})

// locations
// [{id: 1, name: "Meadow", rank: "Novice", region: "Gnawnia"}, ...]

export const fetchAllLocations = () => dispatch => (
  LocationsApiUtil.fetchLocations()
    .then(locations => dispatch(receiveLocations(locations)),
  )
);

export const createLocation = (formData) => dispatch => (
  LocationsApiUtil.postLocation(formData)
    .then(location => dispatch(receiveLocation(location)), 
          err => dispatch(receiveErrors(err.responseJSON)))
);

export const updateLocation = (id, formData) => dispatch => (
  LocationsApiUtil.putLocation(id, formData)
    .then(location => dispatch(receiveLocation(location)), err => dispatch(receiveErrors(err.responseJSON)))
);