import React from 'react';

class PokemonIndex extends React.Component {
    constructor (props) {
        super(props);
    }

    componentDidMount() {
        debugger
        this.props.requestAllPokemon();
        debugger
    }

    render() {
        debugger
        const allPokemon = this.props.pokemon.map( poke => {
            return (
                <li key = {poke.id}>
                    <h2>{poke.name} </h2>
                    <img src={poke.image_url} />
                </li>
            )
        });
        debugger
        return (
            <ul>
                {allPokemon}
            </ul>
        )
    }
}

export default PokemonIndex;