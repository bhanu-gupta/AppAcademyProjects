import {UPDATE_BOUNDS} from '../actions/filter_actions';
import {merge} from 'lodash';

const _defaultFilter = {
    bounds: {lat: [], lng: []}
};

export default (state = _defaultFilter, action) => {
    Object.freeze(state);
    switch (action.type) {
        case UPDATE_BOUNDS:
            return merge({}, state, {bounds: action.bounds});
        default:
            return state;
    }
};