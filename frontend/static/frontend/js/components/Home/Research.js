import React from 'react';
import {
    MDBContainer as Container,
    MDBRow as Row,
    MDBCol as Col,
    MDBTypography as Type,
    MDBIcon as Icon,
} from 'mdbreact';


export default function Research() {
    const researchAreas = [
        { icon: 'microscope', caption: 'Optical Instrumentation' },
        { icon: 'atom', caption: 'Photonics' },
        { icon: 'project-diagram', caption: 'Complex Systems' },
        { icon: 'wave-square', caption: 'Signal and Image Processing' },
        { icon: 'brain', caption: 'Machine Learning' },
    ];

    return (
        <Container fluid className='default-color-dark py-5'>
            <Type tag='h2' variant='h1-responsive' className='text-white text-center mt-3'>Research</Type>
            <Row className='row-cols-1 row-cols-md-5'>
                {researchAreas.map(({ icon, caption }, i) => (
                    <Col className='text-white text-center'>
                        <Icon fas icon={icon} size='10x' className='my-5' />
                        <Type tag='h3' variant='h5-responsive'>{caption}</Type>
                    </Col>
                ))}
            </Row>
        </Container>
    );
}
