export const fetchBenches = (filters) => {
    return $.ajax({
        method: 'GET',
        url: 'api/benches',
        data: {
            bounds: filters.bounds
        },
        error: (err) => console.log(err)
    });
};