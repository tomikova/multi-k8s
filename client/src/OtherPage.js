import React from 'react';
import { Link } from 'react-router-dom';

const content = () => {
    return (
        <div>
            Im some other page! 
            <br/>
            <Link to="/">Go back home</Link>
        </div>
    );
};

export default content;
