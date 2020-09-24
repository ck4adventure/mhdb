import * as ItemsApiUtil from '../util/items_api';

export const RECEIVE_ITEMS = "RECEIVE_ITEMS";
export const RECEIVE_ITEM = "RECEIVE_ITEM";

// sync actions
export const receiveItems = (items) => {
  type: RECEIVE_ITEMS,
  items
}

export const receiveItem = (item) => {
  type: RECEIVE_ITEM,
  item
}


// async actions
export const fetchItems = () => dispatch => (
  ItemsApiUtil.fetchItems()
    .then(
      items => dispatch(receiveItems(items)),
      )
);

export const fetchItem = () => dispatch => (
  ItemsApiUtil.fetchItem().then(item => dispatch(receiveItem(item)))
);

