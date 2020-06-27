import React from 'react';
import {
    MDBContainer as Container,
    MDBRow as Row,
    MDBCol as Col,
    MDBTypography as Type,
} from 'mdbreact';
import { Link } from 'react-router-dom';
import { Image } from 'cloudinary-react';


export default function Principals() {
    const principals = [
        {
            slug: 'csaloma',
            publicId: 'Saloma',
            title: 'Dr. Caesar Saloma',
            body: 'Dr. Caesar Saloma heads Team One of IPL, developing advanced microscope systems for rapid and non-invasive characterization of various systems ranging from semiconductor devices to biological systems. The team also does work on Brownian motion, synchronization and networks.'
        },
        {
            slug: 'msoriano',
            publicId: 'Soriano',
            title: 'Dr. Maricor Soriano',
            body: 'Dr. Maricor Soriano heads the Video and Image Processing (VIP) group which develops instrumentation and algorithms to analyze signals, images, and videos from multidisciplinary domains such as marine science, arts and heritage, forensics, sports, and compressive sensing.'
        },
        {
            slug: 'mlim',
            publicId: 'Lim',
            title: 'Dr. May Lim',
            body: 'The Complex Systems Team (CX-Team) headed by Dr. May Lim investigates sociotechnical systems that are rich in empirical data. The group is actively involved in data mining social media, agent-based modeling of ecological systems, agent-based modeling of vehicular traffic, and analyzing complex networks.'
        },
        {
            slug: 'gtapang',
            publicId: 'Tapang',
            title: 'Dr. Giovanni Tapang',
            body: 'Dr. Giovanni Tapang heads the Sychronization and BioOptics group that looks into patterns and synchronization in historical records, literature, and real signals. The group also works with the adjustment of the rhythms of natural and artificial systems.'
        },
        {
            slug: 'jbantang',
            publicId: 'Bantang',
            title: 'Dr. Johnrob Bantang',
            body: 'The Complexity Science Group (CSG) headed by Dr. Johnrob Bantang investigates biological systems and granular materials from a complex systems perspective. The group also looks into the use of network models in analyzing complex system dynamics such as epidemic spreading and other dynamics related to social and biological structures.'
        },
    ];

    return (
        <Container fluid className='py-5'>
            <Type tag='h2' variant='h1-responsive' className='text-center mt-3 mb-5'>Principal Investigators</Type>
            <Container>
                {principals.map(({ slug, publicId, title, body }, i) => (
                    <React.Fragment key={i}>
                        <Row className={i % 2 === 0 ? null : 'd-flex flex-row-reverse text-md-right'}>
                            <Col md='2' className='mb-3 mb-md-0 d-flex align-items-center'>
                                <Link to={`/profile/${slug}`}>
                                    <Image
                                        cloudName='kdphotography-assets'
                                        className='img-fluid'
                                        publicId={`ipl/${publicId}`}
                                        secure
                                        responsive
                                        responsiveUseBreakpoints
                                        width='auto'
                                        dpr='auto'
                                        crop='scale'
                                        />
                                </Link>
                            </Col>
                            <Col md='10' className='d-flex align-items-right flex-column justify-content-center'>
                                <Type tag='h3' variant='h4-responsive'>{title}</Type>
                                <p>{body}</p>
                            </Col>
                        </Row>
                        <hr />
                    </React.Fragment>
                ))}
            </Container>
        </Container>
    );
}
