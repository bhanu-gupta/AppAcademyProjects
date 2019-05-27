import { combineReducers } from 'redux';
import usersReducer from './users_reducer';
import benchReducer from './benches_reducer';

export default combineReducers({
    users: usersReducer,
    benches: benchReducer
});