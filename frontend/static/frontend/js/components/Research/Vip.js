import React from 'react';
import Helmet from 'react-helmet';
import {
    MDBListGroup as ListGroup,
    MDBListGroupItem as ListGroupItem,
    MDBTypography as Type,
    MDBRow as Row,
    MDBCol as Col,
} from 'mdbreact';
import Loading from '../Loading';


const inNews = [
    {
        link: 'http://www.rappler.com/science-nature/28036-pinoy-gadget-tubbataha-assessments',
        label: '[2013 Rappler] An automated rapid reef assessment system invented by the team of Dr. Maricor Soriano of the University of Philippines (UP) was one of the technologies used to make permanent visual records for the damage done at the Tubbataha reef'
    },
    {
        link: 'http://www.gmanetwork.com/news/video/158284/24oras/pinsala-ng-sumadsad-na-chinese-fishing-vessel-sa-tubbataha-reef-kasinglawak-na-raw-ng-5-basketball-courts',
        label: '[2013 GMANews] Pinsala ng sumadsad na Chinese fishing vessel sa Tubbataha Reef, kasinglawak na raw ng 5 basketball courts'
    },
    {
        link: 'http://www.youtube.com/watch?v=ucMVM3LRqRM',
        label: '[2013 ANC] A new team of experts is headed to Tubbataha to take new images of the reef following the removal of the Chinese fishing vessel'
    },
];

export default class Vip extends React.Component {
    state = {
        publications: [],
        loading: true,
    }

    componentDidMount() {
        this.props.handleHeadline('Video and Image Processing');
        this.props.handleSidebar({
            faculty: ['Dr. Maricor N. Soriano'],
            graduate: [
                'Ritz Aguilar, M.S.',
                'Alfred Abella, M.S.',
                'Wilbur Galarion',
                'Jayson Cubero',
                'Mark Jeremy Narag',
            ],
            undergraduate: [
                'Andrea Advincula',
                'Lou Josef Tan',
                'Creo Baylon',
                'Kenneth Domingo',
                'Rene Principe Jr.',
                'Jemima Bian Anila',
                'Jireh Vera Cruz',
                'Kyngzer-Rem Vargas',
            ],
        });

        fetch('/api/publication?subgroup=VIP&year=2019&publication_type=reg')
            .then(res => res.json())
            .then(publications => this.setState({
                loading: false,
                publications: publications.slice(0, 5),
            }));
    }

    render() {
        if (this.state.loading) return <Loading />;
        else return (
            <div>
                <Helmet>
                    <title>Video and Image Processing | Instrumentation Physics Laboratory</title>
                </Helmet>

                <p>
                    The group works on improving and developing new methods of acquisition and manipulation of images and other signals from cameras and microscopes to extract and enhance information. We develop instrumentation and algorithms to analyse signals, images and video from multidisciplinary domains such as marine science, arts and heritage, medicine, and sports.
                </p>

                <Type tag='h2' variant='h3-responsive text-success mt-5 mb-2'>Recent Publications</Type>
                <ListGroup>
                    {this.state.publications.map((pub, i) => (
                        <ListGroupItem key={i}>
                            <Row>
                                <Col md='10'>
                                    {pub.authors}. {pub.title}. <i>{pub.journal}</i> ({pub.year})
                                </Col>
                                <Col md='2' className='text-right d-flex justify-content-md-end align-items-center'>
                                    <a href={pub.url} rel='noopener noreferrer' target='_blank' className='btn btn-success btn-sm'>Read</a>
                                </Col>
                            </Row>
                        </ListGroupItem>
                    ))}
                </ListGroup>

                <Type tag='h2' variant='h3-responsive text-success mt-5 mb-2'>In the News</Type>
                <ListGroup>
                    {inNews.map((news, i) => (
                        <ListGroupItem key={i}>
                            <Row>
                                <Col md='10'>{news.label}</Col>
                                <Col md='2' className='text-right d-flex justify-content-md-end align-items-center'>
                                    <a href={news.link} rel='noopener noreferrer' target='_blank' className='btn btn-success btn-sm'>Read</a>
                                </Col>
                            </Row>
                        </ListGroupItem>
                    ))}
                </ListGroup>
            </div>
        );
    }
}
