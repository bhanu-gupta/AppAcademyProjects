import React from 'react';
import { Link } from 'react-router-dom';

export default ({poke}) => {
    const pokeUrl = `/pokemon/${poke.id}`;
    return (
        <li>
            <Link to={pokeUrl}>
                <h2>{poke.name} </h2>
                <img src={poke.image_url} />
            </Link>
        </li>
    )
};