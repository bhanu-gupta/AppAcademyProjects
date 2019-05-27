export const getAllSessionErrors = (state) => {
    return Object.values(state.errors.session);
};

export const getAllBenches = (state) => {
    return Object.values(state.entities.benches);
};

