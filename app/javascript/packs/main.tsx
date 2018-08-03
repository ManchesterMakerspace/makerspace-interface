import * as React from 'react';
import * as ReactDOM from 'react-dom';
import { createBrowserHistory } from "history";
import { applyMiddleware, compose, createStore } from 'redux';
import reduxThunk from "redux-thunk";
import { Provider } from "react-redux";
import { connectRouter, routerMiddleware, ConnectedRouter } from 'connected-react-router';

import { rootReducer } from '../ui/reducer';
import Routes from '../app/Routes';
import { createMuiTheme, MuiThemeProvider } from '@material-ui/core';

const init = () => {
  const history = createBrowserHistory();
  const store = createStore(
    connectRouter(history)(rootReducer), // new root reducer with router state
    compose(
      applyMiddleware(
        routerMiddleware(history), // for dispatching history actions
        reduxThunk
      ),
    ),
  )

  const theme = createMuiTheme({
    palette: {
      primary: {
        light: '#9E3321',
        main: '#791100',
        dark: '#510B00',
        contrastText: '#FFF',
      },
    },
  });

  ReactDOM.render(
    <Provider store={store}>
      { /* ConnectedRouter will use the store from Provider automatically */ }
      <ConnectedRouter history={history}>
        <MuiThemeProvider theme={theme}>
          <Routes/>
        </MuiThemeProvider>
      </ConnectedRouter>
    </Provider>,
    document.body.appendChild(document.createElement('div'))
  )
}

init();
