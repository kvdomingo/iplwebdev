import React from 'react';
import Helmet from 'react-helmet';
import {
    MDBContainer as Container,
    MDBIframe as Iframe,
} from 'mdbreact';
import { LoremIpsum as Lipsum } from 'react-lorem-ipsum';


export default class Landing extends React.Component {
    componentDidMount() {
        this.props.handleHeadline('Research');
    }

    render() {
        return (
            <div>
                <Helmet>
                    <title>Research | Instrumentation Physics Laboratory</title>
                </Helmet>
                <Lipsum p={1} startWithLoremIpsum={false} />
                <ul>
                    {[1,2,3].map(i => (
                        <li key={i}><Lipsum p={1} startWithLoremIpsum={false} /></li>
                    ))}
                </ul>
                <Lipsum p={1} startWithLoremIpsum={false} />
            </div>
        );
    }
}
