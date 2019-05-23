import { Provider } from 'react-redux';
import React from 'react';
import PokemonIndexContainer from './pokemon/pokemon_index_container';
import { HashRouter, Route } from 'react-router-dom';
import PokemonDetail from './pokemon/pokemon_detail';

const Root = ({store}) => {
    return (
        <Provider store={store}>
            <HashRouter>
                <>
                    <h1>Pokedex</h1>
                    <Route path='/' component={PokemonIndexContainer} />
                    
                </>
            </HashRouter>
        </Provider>
    )
};

export default Root;