export const RECEIVE_GROUPS = "RECEIVE_GROUPS";
export const RECEIVE_GROUP = "RECEIVE_GROUP";

import * as GroupsApiUtil from "../util/groups_api";

export const receiveGroups = (groups) => ({
  type: RECEIVE_GROUPS,
  groups,
});

export const receiveGroup = (group) => ({
  type: RECEIVE_GROUP,
  group,
});

// groups
// [{ id: 1, name: "Indigenous Mice"},...]

// group
// { id:1, name: "Indigenous Mice", mice: [{id: 1, name: "White",}...]}

// this is, I believe, a thunk
export const fetchAllGroups = () => (dispatch) =>
  GroupsApiUtil.fetchAllGroups().then((groups) =>
    dispatch(receiveGroups(groups))
  );

export const fetchGroup = (groupId) => (dispatch) =>
  GroupsApiUtil.fetchGroup(groupId).then((group) =>
    dispatch(receiveGroup(group))
  );
