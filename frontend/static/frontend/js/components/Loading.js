import React from 'react';
import { MDBContainer as Container } from 'mdbreact';


export default function Loading() {
    return (
        <Container className='text-center my-5 mt-5' style={{ height: '100vh' }}>
            <div className='my-5 mt-5 spinner-grow spinner-grow-lg d-inline-block' />
        </Container>
    );
}
