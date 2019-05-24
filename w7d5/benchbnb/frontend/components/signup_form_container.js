import { connect } from 'react-redux';
import { signup } from '../actions/session_actions';
import SessionForm from './session_form';

const msp = (state, ownProps) => {
    return {
        errors: state.errors,
        formType: 'signup'
    };
};

const mdp = (dispatch, ownProps) => {
    return {
        processForm: (userForm) => dispatch(signup(userForm))
    };
};

export default connect(msp, mdp)(SessionForm);