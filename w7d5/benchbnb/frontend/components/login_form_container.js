import { connect } from 'react-redux';
import {login} from '../actions/session_actions';
import SessionForm from './session_form';

const msp = (state, ownProps) => {
    return {
        errors: state.errors,
        formType: 'login'
    };
};

const mdp = (dispatch, ownProps) => {
    return {
        processForm: (userForm) => dispatch(login(userForm))
    };
};

export default connect(msp, mdp)(SessionForm);