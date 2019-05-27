import {connect} from 'react-redux';
import BenchIndex from './bench_index';
import {getAllBenches} from '../util/selector';
import {fetchBenches} from '../actions/bench_actions';

const msp = state => {
    return {
        benches: getAllBenches(state)
    };
};

const mdp = dispatch => {
    return {
        fetchBenches: () => dispatch(fetchBenches())
    };
};

export default connect(msp, mdp)(BenchIndex);