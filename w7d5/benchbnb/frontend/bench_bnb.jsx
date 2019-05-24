import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { signup } from './actions/session_actions';

document.addEventListener('DOMContentLoaded', () => {
    const store = configureStore();
    const root = document.getElementById('root');
    ReactDOM.render(<Root store={store} />, root);

    window.dispatch = store.dispatch;
    window.getState = store.getState;
});


// window.login = SessionAPIUtil.login;
// window.logout = SessionAPIUtil.logout;
window.signup = signup;