// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import React from 'react'
import ReactDOM from 'react-dom'

import configureStore from '../store/store'
import Root from '../components/root'

import { fetchRanks } from '../actions/ranks_actions'
import * as ItemsApiUtil from '../util/items_api' 

document.addEventListener('DOMContentLoaded', () => {
  // get local storage here if needed
  const store = configureStore();
  // window.dispatch = store.dispatch;
  // window.getState = store.getState;
  // window.fetchRanks = fetchRanks;
  const root = document.getElementById('root')
  ReactDOM.render(<Root store={store}/>, root)
})
