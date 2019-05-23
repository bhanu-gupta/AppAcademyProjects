

export const fetchAllPokemon = () => {
    return $.ajax({
        method: 'GET',
        url: 'api/pokemon'
    });
};

export const fetchPokemon = (poke_id) => {
    return $.ajax({
        method: 'GET',
        url: `api/pokemon/${poke_id}`
    });
}