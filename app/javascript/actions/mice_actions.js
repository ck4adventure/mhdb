export const RECEIVE_MICES = "RECEIVE_MICES";
export const RECEIVE_MOUSE = "RECEIVE_MOUSE";

import * as MiceApiUtil from "../util/mice_api";

// export const receiveMice = (mice) => ({
//   type: RECEIVE_MICE,
//   mice,
// });

export const receiveMouse = (mouse) => ({
  type: RECEIVE_MOUSE,
  mouse,
});

// mouse
// { id: 1, name: "White", points: 300, gold: 400 }

// this is, I believe, a thunk
// export const fetchAllMice = () => (dispatch) =>
//   GroupsApiUtil.fetchAllGroups().then((groups) =>
//     dispatch(receiveGroups(groups))
//   );

export const fetchMouse = (mouseId) => (dispatch) =>
  MiceApiUtil.fetchAMouse(mouseId).then((mouse) =>
    dispatch(receiveMouse(mouse))
  );
