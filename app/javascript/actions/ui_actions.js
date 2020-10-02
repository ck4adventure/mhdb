export const RECEIVE_DRAWER_OPEN = "RECEIVE_DRAWER_OPEN";
export const RECEIVE_DRAWER_CLOSED = "RECEIVE_DRAWER_CLOSED";

export const receiveDrawerOpen = () => ({
  type: RECEIVE_DRAWER_OPEN
});

export const receiveDrawerClosed = () => ({
  type: RECEIVE_DRAWER_CLOSED,
})