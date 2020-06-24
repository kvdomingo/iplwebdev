import React from 'react';
import { Helmet } from 'react-helmet';
import Carousel from './Carousel';
import Research from './Research';
import Principals from './Principals';
import './Home.scss';


export default function Home() {
    return (
        <div className='Container'>
            <Helmet>
                <title>Instrumentation Physics Laboratory</title>
            </Helmet>

            <Carousel />
            <Research />
            <Principals />
        </div>
    );
}
