import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
export const RECEIVE_ONE_POKEMON = 'RECEIVE_ONE_POKEMON';

export const receiveAllPokemon = (pokemon) => {
    return {
        type: RECEIVE_ALL_POKEMON,
        pokemon
    };
};

export const requestAllPokemon = () => {
    // debugger
    return (dispatch) => {
        // debugger
        APIUtil.fetchAllPokemon().then((pokemon) => {
            //  debugger
            return dispatch(receiveAllPokemon(pokemon));
        });
    };
};

export const receiveOnePokemon = (pokemon, items) => {
    return {
        type: RECEIVE_ONE_POKEMON,
        pokemon,
        items
    };
};

export const requestOnePokemon = (poke_id) => {
    return (dispatch) => {
        // debugger
        APIUtil.fetchPokemon(poke_id).then(({pokemon, items}) => {
            // debugger
            return dispatch(receiveOnePokemon(pokemon, items));
        });
    };
};