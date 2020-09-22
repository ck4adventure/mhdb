import React from 'react'
import { Provider } from 'react-redux'

const Root = ({store}) => (
  <Provider store={store}>
    <h2>Hi from Provider</h2>
  </Provider>
)

export default Root;