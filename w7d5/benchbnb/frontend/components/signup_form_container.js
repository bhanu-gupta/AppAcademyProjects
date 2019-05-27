import React from 'react';
import { connect } from 'react-redux';
import { signup } from '../actions/session_actions';
import SessionForm from './session_form';
import { getAllSessionErrors} from '../util/selector';
import { Link } from 'react-router-dom';

const msp = (state, ownProps) => {
    return {
        errors: getAllSessionErrors(state),
        formType: 'signup',
        loginLink: <Link to="/login">Login</Link>
    };
};

const mdp = (dispatch, ownProps) => {
    return {
        processForm: (userForm) => dispatch(signup(userForm))
    };
};

export default connect(msp, mdp)(SessionForm);