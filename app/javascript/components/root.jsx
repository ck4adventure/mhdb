import React from 'react'
import { Provider } from 'react-redux'
import { HashRouter } from 'react-router-dom'
import App from './app'

import { createMuiTheme } from '@material-ui/core/styles';
import { ThemeProvider } from '@material-ui/styles';
import { deepPurple, green, purple, blue } from '@material-ui/core/colors';

const theme = createMuiTheme({
  palette: {
    primary: deepPurple,
    secondary: blue,
  },
});

const Root = ({store}) => (
  <Provider store={store}>
    <HashRouter>
      <ThemeProvider theme={theme}>
        <App />
      </ThemeProvider>
    </HashRouter>
  </Provider>
)

export default Root;