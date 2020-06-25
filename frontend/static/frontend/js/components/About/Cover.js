import React from 'react';
import {
    MDBCard as Card,
    MDBTypography as Type,
} from 'mdbreact';


export default function Cover(props) {
    return (
        <Card className='card-image cover-photo'>
            <div className='text-white d-flex h-100 align-items-end rgba-black-strong py-4 px-5'>
                <div>
                    <Type tag='h2' variant='h5-responsive text-uppercase'>Instrumentation Physics Laboratory</Type>
                    <Type tag='h1' variant='display-4'>{props.headline}</Type>
                </div>
            </div>
        </Card>
    );
}
