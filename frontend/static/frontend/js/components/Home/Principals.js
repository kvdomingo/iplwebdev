import React from 'react';
import {
    MDBContainer as Container,
    MDBRow as Row,
    MDBCol as Col,
    MDBCard as Card,
    MDBTypography as Type,
    MDBCardBody as CardBody,
    MDBCardImage as CardImage,
    MDBCardTitle as CardTitle,
    MDBCardText as CardText,
} from 'mdbreact';
import { Image } from 'cloudinary-react';


export default function Principals() {
    const principals = [
        {
            publicId: 'Saloma',
            title: 'Dr. Caesar Saloma',
            body: 'Dr. Caesar Saloma heads Team One of IPL, developing advanced microscope systems for rapid and non-invasive characterization of various systems ranging from semiconductor devices to biological systems. The team also does work on Brownian motion, synchronization and networks.'
        },
        {
            publicId: 'Soriano',
            title: 'Dr. Maricor Soriano',
            body: 'Dr. Maricor Soriano heads the Video and Image Processing (VIP) group which develops instrumentation and algorithms to analyze signals, images, and videos from multidisciplinary domains such as marine science, arts and heritage, forensics, sports, and compressive sensing.'
        },
        {
            publicId: 'Lim',
            title: 'Dr. May Lim',
            body: 'The Complex Systems Team (CX-Team) headed by Dr. May Lim investigates sociotechnical systems that are rich in empirical data. The group is actively involved in data mining social media, agent-based modeling of ecological systems, agent-based modeling of vehicular traffic, and analyzing complex networks.'
        },
        {
            publicId: 'Tapang',
            title: 'Dr. Giovanni Tapang',
            body: 'Dr. Giovanni Tapang heads the Sychronization and BioOptics group that looks into patterns and synchronization in historical records, literature, and real signals. The group also works with the adjustment of the rhythms of natural and artificial systems.'
        },
        {
            publicId: 'Bantang',
            title: 'Dr. Johnrob Bantang',
            body: 'The Complexity Science Group (CSG) headed by Dr. Johnrob Bantang investigates biological systems and granular materials from a complex systems perspective. The group also looks into the use of network models in analyzing complex system dynamics such as epidemic spreading and other dynamics related to social and biological structures.'
        },
    ];

    return (
        <Container fluid className='py-5'>
            <Type tag='h2' variant='h1-responsive' className='text-center mt-3 mb-5'>Principal Investigators</Type>
            <Row className='row-cols-1 row-cols-md-5'>
                {principals.map(({ publicId, title, body }, i) => (
                    <Col className='mb-3'>
                        <Card className='h-100'>
                            <CardImage
                                className='img-fluid'
                                src={`https://res.cloudinary.com/kdphotography-assets/image/upload/ar_1,c_fill,w_auto,dpr_auto,f_auto,g_face/v1/ipl/${publicId}`}
                                waves
                                />
                            <CardBody>
                                <CardTitle>{title}</CardTitle>
                                <CardText>{body}</CardText>
                            </CardBody>
                        </Card>
                    </Col>
                ))}
            </Row>
        </Container>
    );
}
