import React from 'react';
import Helmet from 'react-helmet';
import {
    MDBContainer as Container,
    MDBRow as Row,
    MDBCol as Col,
} from 'mdbreact';
import { Image } from 'cloudinary-react';


export default function Join() {
    return (
        <Container className='my-5'>
            <Helmet>
                <title>Join | Instrumentation Physics Laboratory</title>
            </Helmet>

            <Row>
                <Col>
                    <Image
                        cloudName='kdphotography-assets'
                        className='img-fluid'
                        publicId='ipl/IPL_app2020'
                        responsive
                        responsiveUseBreakpoints
                        secure
                        width='auto'
                        dpr='auto'
                        crop='scale'
                        />
                </Col>
                <Col>
                    <p>Greetings!</p>
                    <p>
                        The Instrumentation Physics Laboratory is now accepting applications from incoming 3rd year physics/applied physics students for membership starting in the 1st semester of AY 2020-2021.
                    </p>
                    <p>
                        Please note that IPL is only accepting incoming 3rd year physics/applied physics students for membership starting in the 1st semester of AY 2020-2021.
                    </p>
                    <p>
                        Before proceeding with the application form, please make sure that you already have the following required documents prepared:
                    </p>
                    <ul>
                        <li>Certified True Copy of Grades (TCG) or CRS Screenhots (including GWA)</li>
                        <li>Scanned/Pictured Copy of your most recent Form5 (if not available, you may submit on a later date)</li>
                        <li>2x2 recent presentable picture</li>
                        <li>Letter of Intent Addressed to the IPL Coordinator (Dr. Caesar A. Saloma)</li>
                        <li>An essay about the time or situation when you realized that you wanted to be a scientist and your closest experience to being a scientist (Maximum of 300 words)</li>
                    </ul>
                    <p>
                        The deadline for submission of the application form and requirements is on July 17, 2020 (Friday).
                    </p>
                    <p>
                        If there are any inquiries, do not hesitate to e-mail us at <a href='mailto:iplapprocess@gmail.com'>iplapprocess@gmail.com</a> or contact the IPL University Research Associate, Anthony Fox (09053577883).
                    </p>
                    <p>
                        Rest assured that all the information collected will remain strictly confidential and will only be used for the IPL application process.
                    </p>
                    <a
                        href='https://docs.google.com/forms/d/e/1FAIpQLSc-6v4u8Ly5q-gTK06aliTR5cfK_GAffEAaqSU2QVQflouT5w/viewform'
                        rel='noopener noreferrer'
                        target='_blank'
                        className='btn btn-default ml-0'
                        >
                        Apply now
                    </a>
                </Col>
            </Row>
        </Container>
    );
}
