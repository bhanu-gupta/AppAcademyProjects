import {connect} from 'react-redux';
import BenchForm from './bench_form';

const msp = state => {
    // bench: {description: '', lat: '', lng: ''}
};

const mdp = dispatch => {

};

export default connect(msp,mdp)(BenchForm);