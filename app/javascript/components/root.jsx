import React from 'react'
import { Provider } from 'react-redux'
import { HashRouter } from 'react-router-dom'
import App from './app'
import App2 from './app2'

import { createMuiTheme } from '@material-ui/core/styles';
import { ThemeProvider } from '@material-ui/styles';
import { deepPurple } from '@material-ui/core/colors';

const theme = createMuiTheme({
  palette: {
    primary: {
      main: deepPurple[500],
    },
    secondary: {
      main: '#f44336',
    },
  },
});

const Root = ({store}) => (
  <Provider store={store}>
    <HashRouter>
      <ThemeProvider theme={theme}>
        <App2 />
      </ThemeProvider>
    </HashRouter>
  </Provider>
)

export default Root;