import React from 'react';
import PokemonIndexItem from './pokemon_index_item';
import PokemonDetail from './pokemon_detail';
import { Route } from 'react-router-dom';

class PokemonIndex extends React.Component {
    constructor (props) {
        super(props);
    }

    componentDidMount() {
        // debugger
        this.props.requestAllPokemon();
    }

    componentDidUpdate(prevProps) {
        // debugger;
    }

    render() {
        // debugger
        const allPokemon = this.props.pokemon.map( poke => {
            return (
                < PokemonIndexItem poke={poke} key={poke.id} />              
            );
        });
        return (
            <>
            <ul>
                {allPokemon}
            </ul>
            <Route path='/pokemon/:pokemonId' component={PokemonDetail} />
            </>
        )
    }
}

export default PokemonIndex;