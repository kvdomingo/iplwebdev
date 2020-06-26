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
        link: 'http://www.up.edu.ph/visualizing-the-ties-that-bind-in-the-pdaf/',
        label: '[2013 UP Forum] Visualizing the Ties that Bind in the PDAF'
    },
    {
        link: 'http://technology.inquirer.net/29119/what-science-teaches-us-about-the-pork-network',
        label: '[2013 Inquirer Print/inquirer.net] UP physics prof does the math on pork plus NGOs'
    },
    {
        link: 'http://www.gmanetwork.com/news/story/325579/scitech/science/up-physicists-map-pork-releases-from-lawmakers-to-ngos',
        label: '[2013 GMANews] UP physicists map pork releases from lawmakers to NGOs'
    },
    {
        link: 'http://www.abs-cbnnews.com/focus/09/09/13/how-pork-barrel-connects-lawmakers-ngos',
        label: '[2013 ABS-CBN] How pork barrel connects lawmakers, NGOs'
    },
    {
        link: 'http://www.rappler.com/nation/38526-visualizing-pork-barrel-scandal-ties',
        label: '[2013 Rappler] Pork barrel scam: Visualizing the ties that bind'
    },

];

export default class Landing extends React.Component {
    state = {
        publications: [],
        loading: true,
    }

    componentDidMount() {
        this.props.handleHeadline('Team One');
        this.props.handleSidebar({
            faculty: ['Dr. Caesar A. Saloma'],
            graduate: [
                'Teresa Pulido',
                'Joshua Jesli Santiago',
                'Anthony Paul Fox',
            ],
            undergraduate: [
                'Kit Guial',
                'Adrielle Cusi',
                'Rafael Bagood',
                'Alec Rigonan',
                'Bea Movido',
            ],
        });

        fetch('/api/publication?subgroup=ITO&year=2019&publication_type=reg')
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
                    <title>Team One | Instrumentation Physics Laboratory</title>
                </Helmet>

                <p>
                    Professor Dr Saloma aims to provide members of IPL Team One with an enabling and nurturing environment that will entice and prepare them for a productive professional career as an independent scientist and researcher. He and his team are interested in a variety of research topics ranging from formulating novel approaches in signal recovery and information processing under low signal-to-noise ratios to developing a better understanding of the collective dynamics of interacting many-body systems and spatio-temporal social adaptive networks.
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
