import {connect} from 'react-redux';
import {requestAllPokemon} from '../../actions/pokemon_actions';
import PokemonIndex from './pokemon_index';
import {selectAllPokemon} from '../../reducers/selectors';

const msp = (state) => {
    return {
        pokemon: selectAllPokemon(state)
    };
};

const mdp = (dispatch) => {
    return {
        requestAllPokemon: () => {
            // debugger
            return dispatch(requestAllPokemon());
        }
    };
};

export default connect(msp, mdp)(PokemonIndex);