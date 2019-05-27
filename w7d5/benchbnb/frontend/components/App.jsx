import React from 'react';
import GreetingContainer from '../components/greeting_container';
import {AuthRoute, ProtectedRoute} from '../util/route_utils';
import SignupFormContainer from '../components/signup_form_container';
import LoginFormContainer from '../components/login_form_container';
import { Route } from 'react-router-dom';
import SearchContainer from '../components/search_container';

const App = () => {
    return(
        <div>
            <header>
                <h1>Bench BnB</h1>
                <GreetingContainer/>
                <AuthRoute path="/signup" component={SignupFormContainer} />
                <AuthRoute path="/login" component={LoginFormContainer} />
            </header>
            <Route exact path="/" component={SearchContainer} />
        </div>
    )
};

export default App;