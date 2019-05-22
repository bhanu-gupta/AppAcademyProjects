import React from 'react';
import ReactDOM from 'react-dom';
import { receiveAllPokemon, requestAllPokemon} from './actions/pokemon_actions';
import {fetchAllPokemon} from './util/api_util';
import configureStore from './store/store';
import selector from './reducers/selectors';
import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
    const root = document.getElementById('root');
    const store = configureStore();

    // TESTING ONLY
    window.getState = store.getState;
    window.dispatch = store.dispatch;

    ReactDOM.render(<Root store={store}/>, root);
});

window.requestAllPokemon = requestAllPokemon;
window.fetchAllPokemon = fetchAllPokemon;
window.selector = selector;