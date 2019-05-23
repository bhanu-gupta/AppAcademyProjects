import {combineReducers} from 'redux';
import entities from './entities/entitiesReducer';
import ui from './uiReducer';

export default combineReducers({
    entities,
    ui
});