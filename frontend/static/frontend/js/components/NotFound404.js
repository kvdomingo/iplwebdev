import React from 'react';
import Helmet from 'react-helmet';
import {
    MDBContainer as Container,
    MDBTypography as Type,
    MDBIcon as Icon,
} from 'mdbreact';


export default function NotFound() {
    return (
        <Container className='text-center d-flex flex-column align-items-center justify-content-center' style={{ height: '75vh' }}>
            <Helmet>
                <title>Not Found | Instrumentation Physics Laboratory</title>
            </Helmet>

            <Icon fas icon='unlink' size='5x' className='mb-4' />
            <Type tag='h1' variant='display-5'>404: Page Not Found</Type>
            <p>You may have mistyped the address, chap!</p>
        </Container>
    );
}
