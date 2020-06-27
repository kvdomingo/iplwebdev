import React from 'react';
import {
    MDBContainer as Container,
    MDBCol as Col,
    MDBRow as Row,
    MDBTypography as Type,
} from 'mdbreact';
import Loading from '../Loading';


export default class Latest extends React.Component {
    state = {
        data: [],
        loading: true,
    }

    componentDidMount() {
        fetch('/api/publication?publication_type=reg')
            .then(res => res.json())
            .then(res => this.setState({
                data: res.slice(0, 5),
                loading: false,
            }));

        let twitterEmbed = document.createElement('script');
        twitterEmbed.async = true;
        twitterEmbed.src = 'https://platform.twitter.com/widgets.js'
        twitterEmbed.charset = 'utf-8';
        document.body.appendChild(twitterEmbed);
    }

    render() {
        if (this.state.loading) return <Loading />;
        else return (
            <Container fluid className='px-md-5 mb-5'>
                <Row className='row-cols-1 row-cols-md-3'>
                    <Col>
                        <Type tag='h2' variant='h2-responsive'>Recent Publications</Type>
                        <hr />
                        {this.state.data.map((pub, i) => (
                            <div key={i}>
                                <a href={pub.url} target='_blank' rel='noopener noreferrer'>
                                    <p className='lead text-success mb-0'>{pub.title}</p>
                                </a>
                                <p className='text-muted'>{pub.authors} | <i>{pub.journal}</i> <b>{pub.volume}</b></p>
                                <hr />
                            </div>
                        ))}
                    </Col>

                    <Col />

                    <Col>
                        <a class="twitter-timeline" data-height="500" data-dnt="true" data-theme="light" href="https://twitter.com/officialinstru?ref_src=twsrc%5Etfw">Tweets by officialinstru</a>
                    </Col>
                </Row>
            </Container>
        );
    }
}
