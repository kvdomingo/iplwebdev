import React from 'react';
import {
    MDBContainer as Container,
    MDBFooter as Footer,
    MDBRow as Row,
    MDBCol as Col,
    MDBTypography as Type,
    MDBIcon as Icon,
} from 'mdbreact';
import { Image } from 'cloudinary-react';


const footerLinks = [
    {
        link: 'https://our.upd.edu.ph/files/calendar/regular/ACAD%20CAL%202019-2020.pdf',
        label: 'Important Dates'
    },
    {
        link: 'https://docs.google.com/spreadsheets/u/2/d/1qChkLCnlDHZZHZmLgaXndxaQ7H_nRII9a9BpUABdxiU',
        label: 'Seminars'
    },
    {
        link: 'https://docs.google.com/forms/d/1Mc8RJBauLujmmmpBzJ-cyp3Lm92lr3CXIcc7yhqAHZs/viewform',
        label: 'Submit a Plenary Talk'
    },
    {
        link: 'https://docs.google.com/forms/d/1fbLDj27YFPcf5ZMxjLHOOq9YeXzLAyCsjW_rOV2hWQk/viewform',
        label: 'Excuse Form'
    },
    {
        link: 'https://docs.google.com/forms/d/1bGmMcnAu04fY1VjQrcH_tr-pOCju5X9fpLCO0ytdJ-k/viewform',
        label: 'Report an Achievement'
    },
    {
        link: 'https://docs.google.com/a/nip.upd.edu.ph/forms/d/1K4Xp9TDGnR_FNwYNtcHA53IFYFVNO9mWx5XMCeWIiEo/viewform',
        label: 'Report an Acceptance'
    },
];

const footerLogos = [
    {
        link: 'https://up.edu.ph',
        publicId: 'UP'
    },
    {
        link: 'https://science.upd.edu.ph',
        publicId: 'CS'
    },
    {
        link: 'https://nip.upd.edu.ph',
        publicId: 'National_Institute_of_Physics_logo'
    },
    {
        link: 'https://spp-online.org',
        publicId: 'SPP'
    },
];

const date = new Date();

export default function PageFooter() {
    return (
        <Footer className='blue-grey lighten-1'>
            <Container fluid className='text-center text-md-left pt-4 pb-1 px-4'>
                <Row>
                    <Col md='3'>
                        <Type tag='h5' variant='h5-responsive' className='title text-uppercase'>For Members</Type>
                        <ul className='list-unstyled'>
                            {footerLinks.map(({ link, label }, i) => (
                                <li key={link}>
                                    <a href={link} rel='noopener noreferrer' target='_blank'>{label}</a>
                                </li>
                            ))}
                        </ul>
                    </Col>
                    <hr className='clearfix w-100 d-md-none pb-3' />
                    <Col md='6'>
                        <p>
                            Instrumentation Physics Laboratory
                            <br />
                            National Institute of Physics, College of Science
                            <br />
                            University of the Philippines Diliman
                            <br />
                            Quezon City 1101, Philippines
                            <br />
                            +63 (2) 981 8500 loc. 3701-03
                        </p>
                        <a className='mr-2' href='https://facebook.com/officialinstru' rel='noopener noreferrer' target='_blank'>
                            <Icon fab icon='facebook' size='2x' />
                        </a>
                        <a className='mr-2' href='https://twitter.com/officialinstru' rel='noopener noreferrer' target='_blank'>
                            <Icon fab icon='twitter' size='2x' />
                        </a>
                        <a className='mr-2' href='mailto:csaloma@nip.upd.edu.ph' rel='noopener noreferrer' target='_blank'>
                            <Icon fas icon='envelope' size='2x' />
                        </a>
                    </Col>
                    <hr className='clearfix w-100 d-md-none pb-3' />
                    <Col md='3'>
                        <Row className='row-cols-2 row-cols-md-4'>
                            {footerLogos.map(({ publicId, link }, i) => (
                                <Col className='mb-2 px-1' key={link}>
                                    <a href={link} rel='noopener noreferrer' target='_blank'>
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
                                    </a>
                                </Col>
                            ))}
                        </Row>
                    </Col>
                </Row>
            </Container>
            <div className='footer-copyright text-center py-3'>
                &copy; {date.getFullYear()} Instrumentation Physics Laboratory
            </div>
        </Footer>
    );
}
