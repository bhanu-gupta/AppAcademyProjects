import { connect } from 'react-redux';
import Search from './search';
import { getAllBenches, getAllFilters } from '../util/selector';
import { fetchBenches } from '../actions/bench_actions';
import { updateBounds} from '../actions/filter_actions';

const msp = state => {
    return {
        benches: getAllBenches(state),
    };
};

const mdp = dispatch => {
    return {
        fetchBenches: (filters) => dispatch(fetchBenches(filters)),
        updateBounds: (bounds) => dispatch(updateBounds(bounds))
    };
};

export default connect(msp, mdp)(Search);