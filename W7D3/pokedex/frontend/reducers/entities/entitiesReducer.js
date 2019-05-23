import pokemon from './pokemonReducer';
import {combineReducers} from 'redux';
import items from './itemsReducer';

export default combineReducers({
    pokemon,
    items
});