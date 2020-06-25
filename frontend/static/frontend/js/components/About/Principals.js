import React from 'react';
import Helmet from 'react-helmet';
import { Link } from 'react-router-dom';
import {
    MDBRow as Row,
    MDBCol as Col,
    MDBTypography as Type,
} from 'mdbreact';
import { LoremIpsum as Lipsum } from 'react-lorem-ipsum';
import { Image } from 'cloudinary-react';
import Loading from '../Loading';


const principals = [
    {
        slug: 'csaloma',
        publicId: 'Saloma',
        subgroup: 'Team One',
        caption: 'Dr. Caesar Saloma and IPL Team One are engaged in optical instrumentation design, signal and data processing, and complex network analysis. On-going research includes Brownian particle motion-based measurements, optical imaging through highly scattering media, granular mixing, queuing states, collective decision-making in animal communities, and the performance of the Philippine scientific enterprise system.'
    },
    {
        slug: 'msoriano',
        publicId: 'Soriano',
        subgroup: 'Video and Image Processing',
        caption: 'Dr. Maricor Soriano heads the Video and Image Processing (VIP) group which develops instrumentation and algorithms to analyse signals, images and video from multidisciplinary domains such as marine science, arts and heritage, medicine, and sports.'
    },
    {
        slug: 'mlim',
        publicId: 'Lim',
        subgroup: 'Complex Systems Team',
        caption: 'The group headed by Dr. May Lim (Complex System Team) investigates sociotechnical systems that are rich in empirical data. The group is actively involved in data mining social media, agent-based modeling of ecological systems, agent-based modeling of vehicular traffic, and analyzing complex networks.'
    },
    {
        slug: 'gtapang',
        publicId: 'Tapang',
        subgroup: 'Synchronization and BioOptics',
        caption: 'Dr. Giovanni Tapang heads the Synchronization and BioOptics group. Synchronization looks into patterns and synchronization in historical records, literature and real signals. '
    },
    {
        slug: 'jbantang',
        publicId: 'Bantang',
        subgroup: 'Complexity Science Group',
        caption: 'The group headed by Dr. Johnrob Bantang (Complexity Science Group) investigates biological systems and granular materials from a complex system perspective. The group also looks into the use of network models in analyzing complex system dynamics such as epidemic spreading and other dynamics related to social structure.'
    },
];

export default class Principals extends React.Component {
    state = {
        data: {},
        loading: true,
    }

    componentDidMount() {
        this.props.handleHeadline('Principal Investigators');
        fetch('/api/profile')
            .then(res => res.json())
            .then(data => this.setState({ data, loading: false }));
    }

    render() {
        let { data } = this.state;
        if (this.state.loading) return <Loading />;
        else return (
            <div>
                <Helmet>
                    <title>Principal Investigators | Instrumentation Physics Laboratory</title>
                </Helmet>

                <div className='mb-5'>
                    <Type tag='h4' variant='h4-responsive'>
                        <Lipsum p={1} startWithLoremIpsum={false} />
                    </Type>
                    <Lipsum p={2} startWithLoremIpsum={false} />
                </div>
                {principals.map(({ slug, publicId, subgroup, caption}, i) => (
                    <React.Fragment key={slug}>
                        <Row>
                            <Col md='3'>
                                <Link to={`/profile/${slug}`}>
                                    <Image
                                        cloudName='kdphotography-assets'
                                        className='img-fluid'
                                        publicId={`ipl/${publicId}`}
                                        secure
                                        responsive
                                        responsiveUseBreakpoints
                                        width='auto'
                                        crop='scale'
                                        dpr='auto'
                                        />
                                </Link>
                            </Col>
                            <Col md='9'>
                                <Link to={`/profile/${slug}`}>
                                    <Type tag='h3' variant='h4-responsive'>{data[slug].fullName}</Type>
                                </Link>
                                <p className='text-muted'>
                                    {data[slug].role}
                                    <br />
                                    {subgroup}
                                </p>
                                <p>{caption}</p>
                            </Col>
                        </Row>
                        <hr />
                    </React.Fragment>
                ))}
            </div>
        );
    }
}
