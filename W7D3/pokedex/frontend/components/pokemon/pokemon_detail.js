import React from 'react';
import { requestOnePokemon } from '../../actions/pokemon_actions';
import { withRouter } from 'react-router-dom';
import { connect } from 'react-redux';
import { selectAllItems } from '../../reducers/selectors';

class PokemonDetail extends React.Component{
    constructor(props){
        super(props);
    }

    componentDidMount() {
        //  debugger;
        this.props.fetchOnePokemon(this.props.match.params.pokemonId);
        // debugger;
    }

    componentDidUpdate(prevProps) {
        if (prevProps.match.params.pokemonId !== this.props.match.params.pokemonId) {
            // debugger
            this.props.fetchOnePokemon(this.props.match.params.pokemonId);
        }
    }

    render() {
        const {image_url, name, poke_type, attack, defense, moves} = this.props.pokemon;
        const items = this.props.items.map( item => {
            return (<li key={item.id}> {item.name} </li>)
        });
        debugger
        // moves = moves ? moves.join(", ") : "";
        return (
            <>
                <h1>Pokemon Detail</h1>
                <figure><img src={image_url}></img></figure>
                <ul>
                    <li><h1> {name} </h1></li>
                    <li>{poke_type}</li>
                    <li>{attack}</li>
                    <li>{defense}</li>
                    <li>{moves}</li>
                </ul>
                <section>
                    <h3>Items</h3>
                    <ul>
                        {items}
                    </ul>

                </section>
            </>
        );
    }
}

const msp = (state, ownProps) => {
    const pokeId = ownProps.match.params.pokemonId;
    const pokemon = state.entities.pokemon[pokeId] || {};
    debugger
    return {
        pokemon,
        items: selectAllItems(state)
    }
}

const mdp = (dispatch) => {
    return {
        fetchOnePokemon: (id) => dispatch(requestOnePokemon(id))
    }
}

export default withRouter(connect(msp, mdp)(PokemonDetail));
