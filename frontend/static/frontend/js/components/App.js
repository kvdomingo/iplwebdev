import React, { Suspense } from 'react';
import { BrowserRouter as Router } from 'react-router-dom';
import AOS from 'aos';
import Loading from './Loading';
import Navbar from './Navbar';
import Routes from './Routes';


export default class App extends React.Component {
    componentDidMount() {
        AOS.init();
    }

    render() {
        return (
            <Router>
                <Navbar />
                <Suspense fallback={<Loading />}>
                    {Routes}
                </Suspense>
            </Router>
        );
    }
}
