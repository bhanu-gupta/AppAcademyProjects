import { RECEIVE_ALL_POKEMON, RECEIVE_ONE_POKEMON } from '../../actions/pokemon_actions';
import { merge } from 'lodash';

const pokemonReducer = (state = {}, action) => {
    Object.freeze(state);
    switch(action.type){
        case RECEIVE_ALL_POKEMON:
            return merge( {}, state, action.pokemon);
        case RECEIVE_ONE_POKEMON:
            debugger
            const pokemon = action.pokemon;
            // const newState = {
            //     entities: {
            //         pokemon: {
            //             [pokemon.id]: pokemon
            //         },
            //     }
            // };
            return Object.assign({}, state, { [pokemon.id]: pokemon});
        default: return state;
    }
};

export default pokemonReducer;