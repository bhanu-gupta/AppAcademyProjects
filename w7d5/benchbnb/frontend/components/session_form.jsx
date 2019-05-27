import React from 'react';

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
        const all_errors = this.props.errors.map((error, idx) => {
            return <li key={idx}>{error}</li>;
        });
        return (
            <>
            <h1>{this.props.formType}</h1>
            <ul>{all_errors}</ul>
            {this.props.loginLink}
            <form onSubmit={this.handleSubmit}>
                <label htmlFor="username">Username:</label>
                <input type="text" name="username" id="username" onChange={this.handleInput('username')} value={this.state.username}/>
                <label htmlFor="password">Password:</label>
                    <input type="password" name="password" id="password" onChange={this.handleInput('password')} value={this.state.password}/>
                <input type="submit" value="Submit"/>
            </form>
            </>
        );
    }
}

export default SessionForm;