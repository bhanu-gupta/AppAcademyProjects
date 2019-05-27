export const UPDATE_BOUNDS = 'UPDATE_BOUNDS';
import {fetchBenches} from './bench_actions';

export const receiveBounds = (bounds) => {
    return {
        type: UPDATE_BOUNDS,
        bounds
    };
};

export function updateBounds(bounds) {
    return (dispatch, getState) => {
        dispatch(receiveBounds(bounds));
        return fetchBenches(getState().ui.filters)(dispatch);
    };
}