import React from 'react';
import {
    MDBContainer as Container,
    MDBTypography as Type
} from 'mdbreact';


export default function NotFound() {
    return (
        <Container className='text-center d-flex align-items-center justify-content-center' style={{ height: '100vh' }}>
            <Type tag='h1' variant='display-4'>Not Found</Type>
        </Container>
    );
}
