import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { signup, login } from './actions/session_actions';
import { fetchBenches} from './actions/bench_actions';

document.addEventListener('DOMContentLoaded', () => {
    let store;
    if(window.currentUser) {
        const preLoadedState = {
            entities: {
                users: {
                    [window.currentUser.id]: window.currentUser
                }
            },
            session: {
                id: window.currentUser.id
            }
        };
        store = configureStore(preLoadedState);
        delete window.currentUser;
    } else {
        store = configureStore();
    }
    const root = document.getElementById('root');
    ReactDOM.render(<Root store={store} />, root);

    window.dispatch = store.dispatch;
    window.getState = store.getState;
});


// window.login = SessionAPIUtil.login;
// window.logout = SessionAPIUtil.logout;
window.signup = signup;
window.login = login;
window.fetchBenches = fetchBenches;