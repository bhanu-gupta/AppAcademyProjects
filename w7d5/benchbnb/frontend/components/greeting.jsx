import React from 'react';
import {Link} from 'react-router-dom';

const Greeting = ({currentUser, logout}) => {
    if(currentUser) {
        return (
            <>
                <h1>Welcome {currentUser.username}</h1>
                <button onClick={logout}>Logout</button>
            </>
        );
    } else {
        return (
            <>
                <Link to='/signup'>SignUp</Link>
                <Link to='/login'>Login</Link>
            </>
        );
    }
};

export default Greeting;