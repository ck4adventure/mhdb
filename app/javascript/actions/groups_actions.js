export const RECEIVE_GROUPS = "RECEIVE_GROUPS";

import * as GroupsApiUtil from "../util/groups_api";

export const receiveGroups = (groups) => ({
  type: RECEIVE_GROUPS,
  groups,
});

// groups
// [{ id: 1, name: "Indigenous Mice"},...]

// this is, I believe, a thunk
export const fetchGroups = () => (dispatch) =>
  GroupsApiUtil.fetchGroups().then((groups) => dispatch(receiveGroups(groups)));
