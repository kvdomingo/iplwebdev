import React from 'react';
import {
    MDBContainer as Container,
    MDBRow as Row,
    MDBCol as Col,
    MDBTypography as Type,
} from 'mdbreact';
import { Image } from 'cloudinary-react';


export default function Research() {
    const researchAreas = [
        { icon: 'microscope', caption: 'Optical Instrumentation' },
        { icon: 'laser', caption: 'Photonics' },
        { icon: 'network', caption: 'Complex Systems' },
        { icon: 'signal', caption: 'Signal and Image Processing' },
        { icon: 'machine-learning', caption: 'Machine Learning' },
    ];

    return (
        <Container fluid className='default-color-dark py-5'>
            <Type tag='h2' variant='h1-responsive' className='text-white text-center mt-3'>Research</Type>
            <Row className='row-cols-2 row-cols-md-5'>
                {researchAreas.map(({ icon, caption }, i) => (
                    <Col className='text-white text-center'>
                        <Image
                            cloudName='kdphotography-assets'
                            className='img-fluid py-5 px-4 vector-white'
                            publicId={`ipl/${icon}`}
                            secure
                            responsive
                            responsiveUseBreakpoints
                            width='auto'
                            dpr='auto'
                            crop='scale'
                            />
                        <Type tag='h3' variant='h5-responsive'>{caption}</Type>
                    </Col>
                ))}
            </Row>
        </Container>
    );
}
