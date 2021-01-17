export const RECEIVE_STATS = "RECEIVE_STATS";

import * as StatsApiUtil from "../util/stats_api";

export const receiveStats = (stats) => ({
  type: RECEIVE_STATS,
  stats,
});

export const fetchMainStats = () => (dispatch) =>
  StatsApiUtil.fetchStats().then((stats) => dispatch(receiveStats(stats)));
