import { RECEIVE_CURRENT_USER, LOGOUT_CURRENT_USER } from '../actions/session_actions';
import { merge } from 'lodash';

const _nullSession = {id: null};

export default (state = _nullSession, action) => {
    Object.freeze(state);  
    switch (action.type){
        case RECEIVE_CURRENT_USER:
            return merge({}, state, {id: action.user.id});
        case LOGOUT_CURRENT_USER:
            return merge({}, state, {id: null});
        default:
            return state;
    }
};