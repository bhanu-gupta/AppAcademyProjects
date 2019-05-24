import React from 'react';
import {Link} from 'react-router-dom';

class SessionForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            username: '',
            password: ''
        };
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    handleSubmit(e) {
        e.preventDefault();
        this.props.processForm(this.state);
    }

    handleInput(field) {
        return (e) => {
            this.setState({ [field]: e.currentTarget.value});
        };
    }

    render() {
        const type = `/${this.props.formType}`;
        return (
            <>
            <h1>{this.props.formType}</h1>
            <Link to={this.type}>{this.props.formType}</Link>
            <form onSubmit={this.handleSubmit}>
                <label htmlFor="username">Username:</label>
                <input type="text" name="username" id="username" onChange={this.handleInput('username')}/>
                <label htmlFor="password">Password:</label>
                <input type="password" name="password" id="password" onChange={this.handleInput('password')} />
                <input type="submit" value="Submit"/>
            </form>
            </>
        );
    }
}