import React from 'react';
import Helmet from 'react-helmet';
import {
    MDBContainer as Container,
    MDBIframe as Iframe,
} from 'mdbreact';
import { LoremIpsum as Lipsum } from 'react-lorem-ipsum';


export default class Landing extends React.Component {
    componentDidMount() {
        this.props.handleHeadline('About Instru');
    }

    render() {
        return (
            <div>
                <Helmet>
                    <title>About | Instrumentation Physics Laboratory</title>
                </Helmet>
                <Lipsum p={3} startWithLoremIpsum={false} />
                <Container className='text-center my-5 px-0 px-md-5'>
                    <Iframe
                        title='IPL Welcome Video'
                        src="https://www.youtube-nocookie.com/embed/2xGu1Dn_kW0?controls=0"
                        frameborder="0"
                        allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen
                        />
                </Container>
                <Lipsum p={2} startWithLoremIpsum={false} />
            </div>
        );
    }
}
