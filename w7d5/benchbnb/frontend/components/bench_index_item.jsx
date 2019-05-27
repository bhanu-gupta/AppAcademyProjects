import React from 'react';

export default (props) => {
    const {description, lat, lng} = props.bench;
    return (
        <li>
            <p>{description}</p>
            <span>{lat}</span>
            <span>{lng}</span>
        </li>
    );
};