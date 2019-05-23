import { RECEIVE_ONE_POKEMON } from '../../actions/pokemon_actions';

const itemsReducer = (state = {}, action) => {
    Object.freeze(state);
    // debugger
    switch (action.type) {
        case RECEIVE_ONE_POKEMON:
            return Object.assign({}, state, action.items);
        default: return state;
    }
};

export default itemsReducer;