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
        { publicId: 'signalProc', caption: 'Signal Processing' },
        { publicId: 'cxsystems', caption: 'Complex Systems & Networks' },
        { publicId: 'videoimgproc', caption: 'Video & Image Processing' },
        { publicId: 'bio', caption: 'Biological Systems' },
        { publicId: 'optics', caption: 'Optics' },
    ];

    return (
        <Container fluid className='default-color-dark py-5'>
            <Type tag='h2' variant='h1-responsive' className='text-white text-center mt-3'>Research</Type>
            <Row className='row-cols-1 row-cols-md-5'>
                {researchAreas.map(({ publicId, caption }, i) => (
                    <Col>
                        <Image
                            className='img-fluid'
                            cloudName='kdphotography-assets'
                            publicId={`ipl/${publicId}`}
                            secure
                            responsive
                            responsiveUseBreakpoints
                            width='auto'
                            dpr='auto'
                            crop='scale'
                            />
                        <Type tag='h3' variant='h5-responsive' className='text-white text-center'>{caption}</Type>
                    </Col>
                ))}
            </Row>
        </Container>
    );
}
