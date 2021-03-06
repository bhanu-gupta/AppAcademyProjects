import { RECEIVE_ERRORS, RECEIVE_CURRENT_USER } from '../actions/session_actions';

export default (state = [], action) => {
    Object.freeze(state);
    let newState;
    switch (action.type) {
        case RECEIVE_ERRORS:
            newState = state.concat([action.errors]);
            return newState;
        case RECEIVE_CURRENT_USER:
            return [];
        default:
            return state;
    }
};